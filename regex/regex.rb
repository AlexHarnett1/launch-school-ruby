def url?(url)
  url.match?(/^(https:\/\/|http:\/\/)\S+$/)
end

=begin
def url?(text)
  text.match?(/\Ahttps?:\/\/\S+\z/)
end
=end


p url?('https://launchschool.com')     # -> true
p url?('http://example.com')           # -> true
p url?('https://example.com hello')    # -> false
p url?('   https://example.com')       # -> false