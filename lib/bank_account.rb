require 'pry'
require_relative 'transfer.rb'

class BankAccount

    attr_reader :name
    attr_accessor :balance, :status

    # initialize method
    def initialize(name)
        @name = name
        @balance = 1000
        @status = 'open'
    end

    # deposit method
    def deposit(amount)
        self.balance += amount
    end

    # deposit method
    def display_balance
        "Your balance is $#{self.balance}."
    end
    
    # valid? method
    def valid?
        # ternary operator
        self.status == 'open' && self.balance > 0 ? true : false
    end
    
    # close_account method
    def close_account
        self.status = "closed"
    end
end