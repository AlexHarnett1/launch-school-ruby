require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

def prompt(message)
  puts "=> #{message}"
end

def valid_number?(num)
  (num.to_i.to_s == num || num.to_f.to_s == num)
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

prompt(MESSAGES['welcome'])
name = ''
loop do
  name = gets.chomp
  if name.empty?()
    prompt(MESSAGES['valid_name'])
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
    number1_string = gets.chomp
    number1 = number1_string.to_i
    if valid_number?(number1_string)
      break
    else
      prompt(MESSAGES['valid_number'])
    end
  end

  number2 = ''
  loop do
    prompt("Give me a second number")
    number2_string = gets.chomp
    number2 = number2_string.to_i
    if valid_number?(number2_string)
      break
    else
      prompt(MESSAGES['valid_number'])
    end
  end

  # Asks for the type of operation to perform: add, subtract, multiply or divide
  prompt(MESSAGES['choose_operation'])
  operation = ''
  loop do
    operation = gets.chomp
    if ['add', 'subtract', 'multiply', 'divide'].include?(operation)
      break
    else
      prompt(MESSAGES['invalid_operation'])
    end
  end

  prompt("#{operation_to_message(operation)} the two numbers...")

  # Display the result
  result = case operation
           when "add" then number1 + number2
           when "subtract" then number1 - number2
           when "multiply" then number1 * number2
           when "divide" then number1.to_f / number2.to_f
           end

  prompt("The result is #{result}")

  prompt(MESSAGES['another_operation'])
  answer = gets.chomp
  break unless answer.downcase().start_with?('y')
end

prompt("Goodbye")
