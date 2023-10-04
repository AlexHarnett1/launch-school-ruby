#Get two numbers from the user
puts "Give a number"
number1 = gets.chomp.to_i
puts "Give me a second number"
number2 = gets.chomp.to_i

#Asks for the type of operation to perform: add, subtract, multiply or divide
puts "What operation would you like to perform(add, subtract, multiply or divide):"
operation = gets.chomp

#Display the result
case operation
when "add" then puts (number1 + number2).to_s
when "subtract" then puts (number1 - number2).to_s
when "mulitply" then puts (number1 * number2).to_s
when "divide" 
  if(number2 != 0)
    puts (number1.to_f / number2.to_f).to_s
  else
    puts "When using the divide operation the second number may not be a zero!"
  end
else
  puts "You did not enter a valid operation"
end
