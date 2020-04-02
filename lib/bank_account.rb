class BankAccount
    require_relative "transfer"
    
    attr_reader :name
    attr_accessor :bank_account, :balance, :status

    def initialize(name, balance=1000, status="open")
        @name = name
        @balance = balance
        @status = status
    end

    def deposit(deposit_amount)
        @balance += deposit_amount
    end

    def display_balance
        "Your balance is $#{balance}."
    end

    def valid?
        self.status == "open" && self.balance > 0  ? true : false
    end

    def close_account
        @status = "closed"
    end
end