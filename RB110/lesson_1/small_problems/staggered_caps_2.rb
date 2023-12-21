def staggered_case(str)
  chars = str.downcase.chars
  index = 0
  chars.each do |value|
    if (index % 2 == 0 && value.match(/[a-z]/))
      value.capitalize!
      index++
    end
  end
  chars.join
end

p staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS') == 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'