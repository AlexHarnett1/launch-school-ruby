class Banner
  def initialize(message)
    @message = message
  end

  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end

  private

  def horizontal_rule
    "+" + message_length_space('-') + "+"
  end

  def empty_line
    "|" + message_length_space(' ') + "|"
  end

  def message_line
    "| #{@message} |"
  end

  def message_length_space(char)
    str = ''
    (@message.length + 2).times {str << char}
    str
  end
end

banner = Banner.new('To boldly go where no one has gone before.')
puts banner
=begin
+--------------------------------------------+
|                                            |
| To boldly go where no one has gone before. |
|                                            |
+--------------------------------------------+
=end

banner = Banner.new('')
puts banner
=begin
+--+
|  |
|  |
|  |
+--+
=end