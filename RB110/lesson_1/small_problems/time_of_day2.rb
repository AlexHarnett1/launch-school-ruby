MINUTES_IN_A_DAY = 60 * 24

def before_midnight(time)
  hours, minutes = time.split(':').map(&:to_i)

  if (hours == 0 && minutes == 0) || (hours ==24)
    return 0   
  else
    return MINUTES_IN_A_DAY - ((hours * 60) + minutes)
  end
end

def after_midnight(time)
  hours, minutes = time.split(':').map(&:to_i)

  if (hours == 0 && minutes == 0) || (hours ==24)
    return 0
  else
    return (hours * 60) + minutes 
  end
end



p after_midnight('00:00') == 0
p before_midnight('00:00') == 0
p after_midnight('12:34') == 754
p before_midnight('12:34') == 686
p after_midnight('24:00') == 0
p before_midnight('24:00') == 0