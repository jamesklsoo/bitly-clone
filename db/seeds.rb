all_urls = []

File.open("db/urls.csv", "r+") do |x|
  x.each_line do |long_url|
    long_url.gsub!(",\n","")
    long_url.gsub!("(","")
    long_url.gsub!(")","")
    long_url.gsub!(",","")
    long_url.gsub!(";","")

    rnumbers = []
    8.times { rnumbers << rand(1..9) }
    short_url = rnumbers.join.to_i.to_s(36)

    data = "'#{long_url}','#{short_url}'"
    all_urls << data
  end
end

Url.transaction do
  all_urls.each do |data|
    Url.connection.execute "INSERT INTO urls (long_url, short_url) VALUES (#{data})"
  end
end

# require_relative '../db/urls_short.csv'

# s = ''

# File.open("db/urls.csv", "r").each_line do |line|
#   s << range = [*'0'..'9', *'A'..'Z', *'a'..'z']

#   @short_url = (0..6).map{ range.sample }.join
#   self.short_url = @short_url
# end

# p s

# Url.transaction do
#   Url.connection.execute "INSERT INTO url (long_url) VALUES #{s}"
# end
