def prompt(message)
  puts "=> #{message}"
end

def valid_number?(num)
  num.to_i != 0
end

def operation_to_message(op)
  case op
  when 'add'
    "Adding"
  when 'subtract'
    "Subtracting"
  when 'multiply'
    "Multiplying"
  when 'divide'
    "Dividing"
  end
end

prompt("Welcome to calculator! Enter your name: ")
name = ''
loop do
  name = gets.chomp
  if name.empty?()
    prompt("Make sure you enter a valid name.")
  else
    break
  end
end

prompt("Hi #{name}")

loop do # main loop
  # Get two numbers from the user
  number1 = ''
  loop do
    prompt("Give a number")
    number1 = gets.chomp.to_i
    if valid_number?(number1)
      break
    else
      prompt("You didn't input a valid number")
    end
  end

  number2 = ''
  loop do
    prompt("Give me a second number")
    number2 = gets.chomp.to_i
    if valid_number?(number2)
      break
    else
      prompt("You didn't input a valid number")
    end
  end

  # Asks for the type of operation to perform: add, subtract, multiply or divide
  prompt("What operation would you like to perform
    (add, subtract, multiply or divide):")
  operation = ''
  loop do
    operation = gets.chomp
    if ['add', 'subtract', 'multiply', 'divide'].include?(operation)
      break
    else
      prompt("You did not type a valid operation")
    end
  end

  prompt("#{operation_to_message(operation)} the two numbers...")

  # Display the result
  result = case operation
           when "add" then number1 + number2
           when "subtract" then number1 - number2
           when "mulitply" then number1 * number2
           when "divide" then number1.to_f / number2.to_f
           end

  prompt("The result is #{result}")

  prompt("Do you want to perform another calculation?(Y to go again)")
  answer = gets.chomp
  break unless answer.downcase().start_with?('y')
end

prompt("Goodbye")
