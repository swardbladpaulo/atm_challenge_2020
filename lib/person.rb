require './lib/account.rb'

class Person

    attr_accessor :name, :cash, :account

    def initialize(attrs = {})
        @name = set_name(attrs[:name])
        @cash = 0
        @account = nil 
    end
    
    def create_account
        @account = Account.new(owner: self) 
    end

    def deposit(amount)
        @account == nil ? missing_account : withdraw_funds(args)
    end


    private 

    def deposit(amount)
        @account = 
    end

    def set_name(name)
        name == nil ? missing_name : @name = name
    end

    def missing_name
        raise RuntimeError, "A name is required"
    end 
end  