def number?(num)
  num.to_f.to_s == num || num.to_i.to_s == num
end

puts "Hello and welcome to the Mortgage Calculator! Let's begin:"
loop do
  loan_amount = ''
  loop do
    puts "What is the loan amount?"
    loan_amount = gets.chomp
    if loan_amount.empty? || loan_amount.to_f < 0 || !number?(loan_amount)
      puts "Enter a valid number"
    else
      break
    end
  end

  apr = ''
  loop do
    puts "What is the Annual Percentage Rate (Display in integer form. Ex: 5% = 5)"
    apr = gets.chomp
    if apr.empty? || apr.to_f < 0 || !number?(apr)
      puts "Enter a valid number"
    else
      break
    end
  end

  loan_duration = ''
  loop do
    puts "What is the loan duration in months?"
    loan_duration = gets.chomp
    if loan_duration.empty? || loan_duration.to_f < 0 || !number?(loan_duration)
      puts "Enter a valid number"
    else
      break
    end
  end

  monthly_interest_rate = (apr.to_f / 12.0) / 100.0
  f_loan_duration = loan_duration.to_f
  monthly_payment = loan_amount.to_f * (monthly_interest_rate / (1 - ((1 + monthly_interest_rate)**(-f_loan_duration))))

  puts("Your monthly payment is #{monthly_payment}")
  puts("Would you like to make another calculation(y/n)?")
  response = gets.chomp
  break unless response.downcase.start_with?('y')
end
