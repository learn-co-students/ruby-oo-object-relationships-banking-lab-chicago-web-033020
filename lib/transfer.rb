require 'pry'
require_relative 'bank_account.rb'
class Transfer
  attr_reader :sender, :receiver, :amount
  attr_accessor :status

  # initializes with a sender,receiver, status of "pending",transfer amount
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = 'pending'
    @amount = amount
  end
#######################
  # check valid or not for both sender and receiver
  def valid?
    if sender.valid? && receiver.valid?
      return true
    else
      false
    end
  end
##################################
# transaction go through if=> status is "pending" && sender has enough $ in account && account is valid
# change status to rejected and return rejection message if the condition doesn't match
  def execute_transaction
    if self.status == "pending" && @sender.balance > @amount && self.valid?
      @sender.withdraw(@amount) # @sender.balance -= @amount
      @receiver.deposit(@amount) # @receiver.balance += @amount
      @status = "complete"
    else
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end
#############################
# reverse from a completed transaction
  def reverse_transfer
    if self.status == "complete"
      @sender.deposit(@amount)  # @sender.balance -= @amount
      @receiver.withdraw(@amount) # @receiver.balance -= @amount
      @status = "reversed"
    end
  end
end
