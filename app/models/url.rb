require 'uri'

class URL < ActiveRecord::Base
  before_create :shorten, :create
  validates :long_url, :presence => true, :format => URI::regexp(%w(http https))

  def shorten
    range = [*'0'..'9', *'A'..'Z', *'a'..'z']

    @short_url = (0..6).map{ range.sample }.joins
    self.short_url = @short_url
  end

  def counter
    self.click_count = 0
  end
end
