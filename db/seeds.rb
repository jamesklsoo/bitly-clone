require_relative '../app/models/url.rb'
require 'securerandom'

s = ''

File.open("db/urls.csv", "r").each_line do |line|
  s << "('#{line[1..-4]}', '#{SecureRandom.hex(6)}', 0)#{line[-2]}"
end

sql = "INSERT INTO urls (long_url, short_url, click_count) VALUES #{s}"

Url.transaction do
  Url.connection.execute sql
end
