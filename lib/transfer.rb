# require_relative 'bankaccount'
class Transfer
  attr_accessor :sender, :receiver, :status, :amount
    def initialize(sender, receiver, amount, status="pending")
      @sender = sender
      @receiver = receiver
      @status = "pending"
      @amount =  amount
    end

    def valid?
      if sender.valid? == receiver.valid?
        true
      else
        false
      end
    end

    def execute_transaction
      if @sender.balance > @amount && self.status == "pending" && self.valid?
        @sender.withdraw(@amount)
        @receiver.deposit(@amount)
        @status = "complete"
      else
        @status = "rejected"
        return "Transaction rejected. Please check your account balance."
      end
    end

      def reverse_transfer
    if self.status == "complete"
      @receiver.withdraw(@amount)
      @sender.deposit(@amount)
      @status = "reversed"
      end
    end
end
