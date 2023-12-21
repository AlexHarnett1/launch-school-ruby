def staggered_case(str)
  chars = str.downcase.chars
  chars.each_with_index { |value, index| value.capitalize! if index % 2 == 0}
  chars.join
end

p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'