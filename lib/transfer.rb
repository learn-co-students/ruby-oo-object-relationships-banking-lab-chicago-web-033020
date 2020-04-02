class Transfer

  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, status="pending", amount)
    @sender = sender
    @receiver = receiver
    @status = status
    @amount = amount
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if (self.valid? && status=="pending" && sender.balance > amount)
      self.sender.balance -= amount
      self.receiver.balance += amount
      self.status = "complete"
    else
       self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if (status=="complete")
      sender.balance += amount
      receiver.balance -= amount
      self.status = "reversed"
    end
  end
end 
