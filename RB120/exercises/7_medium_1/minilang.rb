class Minilang
  def initialize(strcommand)
    @commands = strcommand.split(" ")
    @stack = []
  end

  def eval
    register = 0
    @commands.each do |val|
      if val.to_i.to_s == val
        register = val.to_i
        next
      end
      case val
      when 'PRINT' then puts register
      when 'PUSH' then @stack.push(register)
      when 'ADD' then register += @stack.pop
      when 'SUB'  then register -= @stack.pop
      when 'MULT' then register *= @stack.pop
      when 'DIV' then (register /= @stack.pop).to_i
      when 'MOD' then register %= @stack.pop
      when 'POP' then register = @stack.pop
      else 
        puts "INVALID TOKEN: #{val}"
        return
      end
    end
  end
end

Minilang.new('PRINT').eval
# 0

Minilang.new('5 PUSH 3 MULT PRINT').eval
# 15

Minilang.new('5 PRINT PUSH 3 PRINT ADD PRINT').eval
# 5
# 3
# 8


Minilang.new('5 PUSH 10 PRINT POP PRINT').eval
# 10
# 5

Minilang.new('5 PUSH POP POP PRINT').eval
# Empty stack!

Minilang.new('3 PUSH PUSH 7 DIV MULT PRINT ').eval
# 6

Minilang.new('4 PUSH PUSH 7 MOD MULT PRINT ').eval
# 12

Minilang.new('-3 PUSH 5 XSUB PRINT').eval
# Invalid token: XSUB

Minilang.new('-3 PUSH 5 SUB PRINT').eval
# 8

Minilang.new('6 PUSH').eval
# (nothing printed; no PRINT commands)
