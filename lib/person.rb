require './lib/account.rb'

class Person
    attr_accessor :name, :cash, :account

    def initialize(attrs = {})
        @name = set_name(attrs[:name])
        @cash = 0
        @account = nil 
    end
    
    def create_account
        @account = Account.new(owner: self) # 
    end

    def deposit(amount)
        @account == nil ? missing_account : deposit_funds(amount) # 1. is account ok? 2. If not go to missing account 3. else go to def deposit_funds
    end

    private 

    def deposit_funds(amount)
       @account.balance += amount # same account as on row 9
       @cash -= amount
    end

    def set_name(name)
        name == nil ? missing_name : @name = name
    end

    def missing_name
        raise RuntimeError, "A name is required"
    end 
end  