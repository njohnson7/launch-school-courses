require 'minitest/autorun'
require 'minitest/reporters'

Minitest::Reporters.use!

class Test < Minitest::Test
  def setup
    @value = 1
  end

  # def test_value_odd_question
  #   puts self             # Test#test_value_odd_question
  #   p self #  #<Test:0x00000000faebf0 @NAME="test_value_odd_question",
  #          #    @failures=[], @assertions=0, @value=1>
  #   p self.class          # Test
  #   p Minitest.ancestors  # [Minitest]

  #   p assert(@value.odd?)       #=> true (passes)
  #   p self.assert(@value.odd?)  #=> true (passes)

  #   p self #  #<Test:0x00000000faebf0 @NAME="test_value_odd_question",
  #          #    @failures=[], @assertions=2, @value=1>
  #   p m = method(:assert) #  #<Method: Test(Minitest::Assertions)#assert>
  #   p m.owner             # Minitest::Assertions
  #   puts m.receiver       # Test#test_value_odd_question
  #   p Test.included_modules
  #     # [Minitest::Guard, Minitest::Test::LifecycleHooks,
  #     #  Minitest::Assertions,Minitest::Expectations, Kernel]
  # end

  def test_downcase
    value = 'XYz'
    assert_equal 'xyz', value.downcase
  end

  def test_nil
    value = nil
    assert_nil value
    assert_predicate(value, :nil?)
  end

  def test_empty
    list = []
    assert_equal [], list
    assert_predicate list, :empty?
    assert_empty list
    assert_equal true, list.empty?
  end

  def test_include
    list = ['xyz']
    assert_includes list, 'xyz'
    assert_equal true, list.include?('xyz')
  end

  NoExperienceError = Class.new(StandardError)

  def test_no_experience_error
    employee = 'employee'
    employee.define_singleton_method(:hire) { raise NoExperienceError }
    assert_raises(NoExperienceError) { employee.hire }
  end

  def test_numeric_instance
    value = Numeric.new
    assert_instance_of(Numeric, value)
    assert_equal(Numeric, value.class.ancestors.first)
    assert_same(Numeric, value.class.ancestors.first)
  end

  def test_numeric_subclass
    value = 1
    assert_kind_of(Numeric, value)
    assert_includes(value.class.ancestors, Numeric)
    value = 2.0
    assert_kind_of(Numeric, value)
    assert_includes(value.class.ancestors, Numeric)
    value = Numeric.new
    assert_kind_of(Numeric, value)
    assert_includes(value.class.ancestors, Numeric)
  end

  def test_list_process
    list = [1, 2, 3]
    list.define_singleton_method(:process) { self }
    assert_same(list, list.process)
    assert(list.equal?(list.process))
    assert(list.object_id == list.process.object_id)
  end

  def test_xyz_refute
    list = ['xy']
    refute_includes(list, 'xyz')
  end
end
