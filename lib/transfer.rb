require 'pry'
require_relative 'bank_account.rb'

class Transfer
  attr_reader :sender, :receiver, :amount
  attr_accessor :name, :status

  @@all = []

  def self.all
    @@all
  end

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
    self.class.all << self
  end

  def valid?
    self.sender.valid? && self.receiver.valid?
  end

  def execute_transaction
    if self.status == "pending"
      #binding.pry
      if self.sender.balance < self.amount || self.sender.status == "closed" || self.receiver.status == "closed"
        self.status = "rejected"
        "Transaction rejected. Please check your account balance."
      else
        self.sender.balance -= self.amount
        self.receiver.balance += self.amount
        self.status = "complete"
      end
    end
  end

  def reverse_transfer
      if self.status == "complete" 
        self.receiver.balance -= self.amount
        self.sender.balance += self.amount
        self.status = "reversed"
      end
  end

end

# terrance = BankAccount.new("Terrance")
# amanda = BankAccount.new("Amanda")
# # # terrance.close_account
# transfer_one = Transfer.new(amanda, terrance, 50)
# transfer_two = Transfer.new(amanda, terrance, 100)
# transfer_one.execute_transaction
# transfer_two.execute_transaction
# transfer_one.reverse_transfer

# binding.pry