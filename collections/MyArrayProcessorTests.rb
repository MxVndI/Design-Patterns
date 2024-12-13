require 'minitest/autorun'
require_relative 'MyArrayProcessor.rb'

class MyArrayProcessorTest < Minitest::Test
  def setup
    @array_processor = MyArrayProcessor.new(array: [1, 2, 3, 4, 5])
  end

  def test_should_be_able_to_cycle_repeats_array_elements
    result = []
    @array_processor.cycle(2) { |x| result.append(x) }
    assert_equal [1, 2, 3, 4, 5, 1, 2, 3, 4, 5], result
  end

  def test_should_be_able_to_inject_and_sum_array_elements
    sum = @array_processor.inject { |acc, x| acc + x }
    assert_equal 15, sum
  end

  def test_should_be_able_to_reject_filters_out_even_numbers
    rejected = @array_processor.reject { |x| x.even? }
    assert_equal [1, 3, 5], rejected
  end

  def test_should_be_able_to_return_single_max_element
    max_by = @array_processor.max_by { |x| x.to_s.length }
    assert_equal 5, max_by
  end

  def test_shoud_be_sliced
    result = []
    @array_processor.each_slice(2) { |slice| result.append(slice) }
    assert_equal [[1, 2], [3, 4], [5]], result
  end
  
  def test_should_be_able_to_return_multiple_max_elements
    max_by = @array_processor.max_by(2) { |x| x.to_s.length }
    assert_equal [5, 4], max_by
    assert_equal 2, max_by.length
  end

  def test_shoud_be_sorted_by_desc
    sorted = @array_processor.sort_by { |a, b| a < b }
    assert_equal [5, 4, 3, 2, 1], sorted
  end
end
