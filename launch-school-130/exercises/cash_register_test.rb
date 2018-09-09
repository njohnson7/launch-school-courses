require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!
require_relative 'cash_register'
require_relative 'transaction'


class CashRegisterTest < Minitest::Test
  def setup
    @register = CashRegister.new(1000)
    @transaction_under = Transaction.new(100)
    @transaction_under.amount_paid = 50
    @transaction_even = Transaction.new(100)
    @transaction_even.amount_paid = 100
    @transaction_over = Transaction.new(100)
    @transaction_over.amount_paid = 150
  end

  def test_total_money
    assert_equal(1000, @register.total_money)
  end

  def test_accept_money
    @register.accept_money(@transaction_under)
    assert_equal(1050, @register.total_money)
    @register.accept_money(@transaction_under)
    assert_equal(1100, @register.total_money)

    previous_amount = @register.total_money
    @register.accept_money(@transaction_over)
    current_amount = @register.total_money
    assert_equal(previous_amount + 150, current_amount)
  end

  def test_change
    assert_equal(50, @register.change(@transaction_over))
    assert_equal(0, @register.change(@transaction_even))
    assert_equal(-50, @register.change(@transaction_under))
  end

  def test_give_receipt
    receipt_msg = "You've paid $100.\n"
    assert_output(receipt_msg) { @register.give_receipt(@transaction_even) }
  end

  def test_prompt_for_payment
    transaction = Transaction.new(100)
    capture_io { transaction.prompt_for_payment(input: File.new('payment.txt')) }
    assert_equal(100, transaction.amount_paid)

    transaction = Transaction.new(100)
    input = StringIO.new("150\n")
    capture_io { transaction.prompt_for_payment(input: input) }
    assert_equal(150, transaction.amount_paid)
  end

  # using a File instead of StringIO:
  def test_prompt_for_payment2
    transaction = Transaction.new(50)
    paid = File.new('paid.txt', 'r+')
    paid.puts('75\n')
    capture_io { transaction.prompt_for_payment(input: File.new(paid)) }
    paid.close
    assert_equal(75, transaction.amount_paid)
  end

  def test_prompt_for_payment3
    transaction = Transaction.new(100)
    input = StringIO.new("150\n")
    output = StringIO.new
    transaction.prompt_for_payment(input: input, output: output)
    assert_equal(150, transaction.amount_paid)
  end
end
