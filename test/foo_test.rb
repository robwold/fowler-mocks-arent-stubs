require 'test_helper'
require 'minitest/autorun'
require 'foo.rb'

class FooTest < Minitest::Test

  def setup
    @subject = Foo.new
  end

  def test_foo
   expected = 'foo'
   actual = @subject.foo
   assert_equal expected, actual
  end

  def test_bar
    expected = 'bar'
    actual = @subject.bar
    assert_equal expected, actual
  end
end