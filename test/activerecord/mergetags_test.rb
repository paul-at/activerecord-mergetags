require 'test_helper'

class Activerecord::MergetagsTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Activerecord::Mergetags::VERSION
  end

  def test_it_replaces_a_string
    str = 'abc *|STRING|*'
    result = ::Activerecord::Mergetags::Merge.merge(str, Activerecord::Mock.new)
    assert_equal 'abc MyString', result
  end

  def test_it_replaces_an_integer
    str = 'abc *|INTEGER|*'
    result = ::Activerecord::Mergetags::Merge.merge(str, Activerecord::Mock.new)
    assert_equal 'abc 5', result
  end

  def test_it_replaces_a_datetime
    str = 'abc *|DATETIME|*'
    result = ::Activerecord::Mergetags::Merge.merge(str, Activerecord::Mock.new)
    assert_equal 'abc October 06, 2016', result
  end

  def test_it_replaces_an_association
    str = 'abc *|ASSOCIATION.INTEGER|* *|ASSOCIATION.STRING|*'
    result = ::Activerecord::Mergetags::Merge.merge(str, Activerecord::Mock.new)
    assert_equal 'abc 5 MyString', result
  end

  def test_it_doesnt_crash_when_association_is_missing
    str = 'abc *|MISSING_ASSOCIATION.INTEGER|* *|ASSOCIATION.STRING|*'
    result = ::Activerecord::Mergetags::Merge.merge(str, Activerecord::Mock.new)
    assert_equal 'abc MISSING_ASSOCIATION.INTEGER ASSOCIATION MISSING MyString', result
  end
end
