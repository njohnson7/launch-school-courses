require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'text'

class TextTest < Minitest::Test
  def setup
    @text_file = File.open('sample_text.txt', 'r')
    @text_obj = Text.new(@text_file.read)
  end

  def test_swap
    # since there is no getter for @text, we can access @text by doing either:
    # text_before = @text_obj.instance_variable_get(:@text)     # <- option 1
    text_before = @text_obj.swap('', '')                        # <- option 2
    a_count = text_before.count('a')
    refute(a_count.zero?)
    e_count = text_before.count('e')
    a_e_total = a_count + e_count

    text_after = @text_obj.swap('a', 'e')
    assert_equal(0, text_after.count('a'))
    assert_equal(a_e_total, text_after.count('e'))
  end

  def test_word_count
    expected_word_count = @text_obj.swap('', '').scan(/\w+/).size
    actual_word_count = @text_obj.word_count
    assert_equal(expected_word_count, actual_word_count)
  end

  def teardown
    @text_file.close
    puts "File has been closed: #{@text_file.closed?}"
  end
end
