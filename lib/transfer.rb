require 'pry'
require_relative 'bank_account.rb'
class Transfer
  
  attr_accessor :amount, :status, :receiver, :sender
  # initialize method
    def initialize(sender, receiver, amount)
        @sender = sender
        @receiver = receiver
        @amount = amount
        @status = "pending"
    end
    # valid? method
    def valid?
      # ternary operator
      sender.valid? == true && receiver.valid? == true ? true : false
    end
    # execute_transaction method
    def execute_transaction
      
      if self.status == "pending" && sender.balance > amount && valid?
        sender.balance -= amount
        receiver.balance += amount
        self.status = "complete"
      else
        self.status = "rejected"
        "Transaction rejected. Please check your account balance."
      end
    end
    # execute_transaction method
    def reverse_transfer
        if self.status == "complete"
          sender.balance += amount
          receiver.balance -= amount
          self.status = "reversed"
        end
    end
end