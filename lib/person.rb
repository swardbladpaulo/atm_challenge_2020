require './lib/account.rb'
require './lib/atm.rb'

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
    
    def missing_account
        raise RuntimeError, "No account present"
    end

    def withdraw(args = {})
        @account == nil ? missinng_account : withdraw_funds(args)
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

    def withdraw_funds(args)
        args[:atm] == nil ? missing_atm : atm = args[:atm]
        account = @account
        amount = args[:amount]
        pin = args[:pin]
        response = atm.withdraw(amount, pin, account)
        response[:status] == true ? increase_cash(response) : response
    end

    def increase_cash(response)
        @cash += response[:amount]
    end
    
    def missing_atm
        raise RuntimeError, 'An ATM is required'
    end
end 
