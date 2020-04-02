require_relative 'transfer'

class BankAccount
  attr_reader :name
  attr_accessor :bank_account, :status, :balance

  def initialize(name, status="open", balance=1000) 
    @name = name
    @status = status
    @balance = balance
  end 

  def deposit(deposit_amount)
    @balance += deposit_amount
  end 

  def display_balance
    "Your balance is $#{@balance}."
  end 
  
  def valid?
    # status_check = (self.status == "open" ? true : false)
    # balance_check = (self.balance > 0 ? true : false)
    self.status == "open" && self.balance > 0 ? true : false
  end 

  def close_account
    @status = "closed"
  end 

end
