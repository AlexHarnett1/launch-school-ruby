require 'minitest/autorun'

require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < Minitest::Test
  def setup
    
  end

  def test_accept_money
    register = CashRegister.new(50)
    trans = Transaction.new(40)
    trans.amount_paid = 40
    assert_equal(90, register.accept_money(trans))
  end

  def test_change
    register = CashRegister.new(50)
    tran = Transaction.new(40)
    tran.amount_paid = 50
    assert_equal(10, register.change(tran))
  end

  def test_give_receipt
    register = CashRegister.new(50)
    tran = Transaction.new(40)
    assert_output("You've paid $40.\n") {register.give_receipt(tran)}
  end
end
