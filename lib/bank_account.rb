require_relative 'transfer'
require 'pry'

class BankAccount
  attr_accessor :balance, :status
  def initialize(name, balance=1000, status="open")
    @name = name
    @balance = balance
    @status = status
  end

  def name
    @name
  end

  # def balance
  #   @balance
  # end

  def status
    @status
  end

  def deposit(balance)
    @balance += balance
    # self.balance +=
  end
def withdraw(balance)
  @balance -= balance
end

  def display_balance
     return "Your balance is $#{balance}."
  end

  def valid?
    if balance > 0 && status == "open"
      true
    else balance < 0 && status == "closed"
          false
    end
  end

  def close_account
    self.status = "closed"
  end

end
