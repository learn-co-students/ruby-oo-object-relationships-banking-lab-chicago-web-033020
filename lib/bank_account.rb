require 'pry'
require_relative 'transfer.rb'

class BankAccount
  attr_reader :name  #name can NOT be change
  attr_accessor :balance, :status

  #   initializes with a name, balance of 1000,status of 'open'
  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end
#########################
#add $ to bank account
  def deposit(money)
    @balance += money
  end
########################
#substract $ from bank account
  def withdraw(amount)
    @balance -= amount
  end
######################
#show balance
  def display_balance
    p "Your balance is $#{self.balance}."
  end
#########################
#check valid or not && balance > 0
  def valid?
    if status == "open" && @balance > 0
      return true
    else
      return false
    end
  end
#######################
#close bank account
  def close_account
    @status = "closed"
  end
end
