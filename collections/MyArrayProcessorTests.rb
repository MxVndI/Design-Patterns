require 'minitest/autorun'
require_relative 'MyArrayProcessor.rb'
class MyArrayProcessorTest < Minitest::Test
  def setup
    @array_processor = MyArrayProcessor.new(array: [1, 2, 3, 4, 5])
  end

  def test_cycle
    result = []
    @array_processor.cycle(2) { |x| result.append(x) }
    assert_equal [1, 2, 3, 4, 5, 1, 2, 3, 4, 5], result
  end

  def test_inject
    sum = @array_processor.inject { |acc, x| acc + x }
    assert_equal 15, sum
  end

  def test_reject
    rejected = @array_processor.reject { |x| x.even? }
    assert_equal [1, 3, 5], rejected
  end
end