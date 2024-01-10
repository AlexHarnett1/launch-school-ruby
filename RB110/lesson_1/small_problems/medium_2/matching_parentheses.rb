def balanced?(str)
  str.gsub!(/[^()]/, '')
  last_right = true
  str.split('').each do |char|
    if (char == "(" && last_right) || (char == ')' && !last_right)
      last_right = !last_right
    else
      return false  
    end
  end
  return true

end

p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false
p balanced?('What ())(is() up') == false