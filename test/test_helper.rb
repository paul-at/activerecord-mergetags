$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'activerecord/mergetags'

require 'minitest/autorun'

class Activerecord::Mock
  def [](attribute)
    case attribute
      when :string then "MyString"
      when :integer then 5
      when :datetime then ActiveSupport::TimeWithZone.new
    end
  end

  def association
    Activerecord::Mock.new
  end
end

module ActiveSupport
  class TimeWithZone
    def to_date
      Date.new
    end
  end
end

class Date
  def to_formatted_s(format)
    "October 06, 2016"
  end
end