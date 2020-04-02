class BankAccount

  attr_accessor :balance, :status
  attr_reader :name


  def initialize(name, balance = 1000, status = "open") 
    @name = name
    @balance = balance
    @status = status
  end

  def deposit(deposit)
    self.balance += deposit
  end

  def display_balance
    "Your balance is $#{self.balance}."
  end

  def valid?
    status == "open" && balance > 0
  end

  def close_account
    if self.status == "open"
      self.status = "closed"
    end
  end

end
