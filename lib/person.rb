

class Person

    attr_accessor :exp_date, :account_status, :pin_code, :balance, :owner 

    def initialize(attrs= {})
        @owner = 'Paulo'
        @balance = 1000
        @exp_date = '10/25'
        @account_status = :active 
        @pin_code = '1234'
        set_owner(attrs[:owner])
    end
end