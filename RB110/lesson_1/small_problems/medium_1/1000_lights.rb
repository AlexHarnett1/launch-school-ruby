require "pry-byebug"

def get_new_val(current_val)
  if current_val == "on" then "off" 
  else "on"
  end
end


def toggle_lights(n)
  arr = []
  n.times { arr << 'on'}
  round = 2
  loop do 
    arr.each_with_index do |val, index|
      if(index + 1) % round == 0
        arr[index] = get_new_val(val)
      end
    end
    round += 1
    break if round > n
  end
  lights_on = []
  arr.each_with_index { |val, index| lights_on << (index + 1) if val == "on"}
  lights_on
end



p toggle_lights(1000)