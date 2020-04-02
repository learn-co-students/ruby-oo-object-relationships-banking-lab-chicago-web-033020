require 'pry'
require_relative 'bank_account.rb'
require_relative 'transfer.rb'

# Bank account creations
isaac = BankAccount.new("Isaac")
stefani = BankAccount.new("Stefani")

# Transfer creation
isaac_to_stefani = Transfer.new(isaac, stefani, 50)

binding.pry