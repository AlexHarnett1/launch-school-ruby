#! /usr/bin/env ruby

require 'io/console'
require "pg"

class ExpenseData

  def initialize
    @connection = PG.connect(dbname: "expenses")
    setup_schema
  end

  def list_expenses
    result = @connection.exec("SELECT * FROM expenses ORDER BY created_on ASC")
    display_expenses(result)
  end

  def add_expense(amount, memo)
    @connection.exec_params("INSERT INTO expenses(amount, memo, created_on) VALUES ($1, $2, NOW())", [amount, memo])
  end

  def search_expenses(memo)
    result = @connection.exec_params("SELECT * FROM expenses WHERE memo ILIKE $1", [memo])
    display_expenses(result)
  end

  def delete_expense(id)
    result = @connection.exec_params("SELECT * FROM expenses WHERE id = $1", [id])
    if(result.ntuples == 1)
      puts "There is no expense with the id '#{id}'"
    else
      @connection.exec_params("DELETE FROM expenses WHERE id = $1", [id])
      puts "The following expense has been deleted:"
      display_expenses(result)
    end
  end

  def clear_expenses
    @connection.exec_params("DELETE FROM expenses;")
    puts "All expenses have been deleted."
  end

  private

  def display_expenses(expenses)
    display_count(expenses)
    expense_total = 0
    expenses.each do |tuple|
      expense_total += tuple["amount"].to_f
      columns = [ tuple["id"].rjust(3),
                    tuple["created_on"].rjust(10),
                    tuple["amount"].rjust(12),
                    tuple["memo"] ]

        puts columns.join(" | ")
    end
    if expenses.ntuples > 0
      puts "-" * 50
      puts "Total #{format('%.2f', expense_total.to_s).rjust(25)}"
    end
  end

  def display_count(expenses)
    count = expenses.ntuples
    case count
    when 0
      puts "There are no expenses."
    when 1
      puts "There is 1 expense."
    else 
      puts "There are #{count} expenses."
    end
  end

  def setup_schema
    result = @connection.exec("SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'public' AND table_name = 'doesnotexist';")
    if result[0]["count"] == "0"
      @connection.exec("CREATE TABLE expenses(
                          id SERIAL PRIMARY KEY,
                          amount NUMERIC(6, 2) NOT NULL CHECK (amount > 0),
                          memo varchar(50) NOT NULL,
                          created_on DATE NOT NULL);"
                      )
    end
  end
end

class CLI

  def initialize
    @application = ExpenseData.new

  end


  def run(arguments)
    command = arguments.shift
    case command
      when "add"
        if (ARGV[0] && ARGV[1])
          @application.add_expense(ARGV[0], ARGV[1])
        else
          puts "You must provide an amount and memo."
        end
      when "clear"
        puts "This will remove all expenses. Are you sure? (y/n)"
        response = $stdin.getch
        @application.clear_expenses if response == "y"
      when "list"
        @application.list_expenses
      when "delete"
        @application.delete_expense(ARGV[0])
      when "search"
        if(ARGV[0])
          @application.search_expenses(ARGV[0])
        else
          puts "You must provide a search parameter."
        end
      else
        display_help
    end
  end

  def display_help

    puts <<~HELP
      An expense recording system

      Commands:

      add AMOUNT MEMO - record a new expense
      clear - delete all expenses
      list - list all expenses
      delete NUMBER - remove expense with id NUMBER
      search QUERY - list expenses with a matching memo field
    HELP
  end

end

CLI.new.run(ARGV)