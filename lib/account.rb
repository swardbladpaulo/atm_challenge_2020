require 'date'

class Account 
    STANDARD_VALIDITY_YRS = 5

    attr_accessor  :exp_date, :account_status, :pin_code, :balance, :owner

    def initialize(attrs = {}) 
        @owner = 'Paulo'
        @balance = 0
        @exp_date = '10/25'
        @account_status = :active
        @pin_code = '1234'
        set_owner(attrs[:owner])
    end

    def set_expire_date
      Date.today.next_year(STANDARD_VALIDITY_YRS).strftime('%m/%y')
    end

    def deactivate
      @account_status = :deactivated
    end

    private
    
    def set_owner(obj)
      obj == nil ? missing_owner : @owner = obj
    end

    def missing_owner
      raise "An account owner is required"
    end

    def set_pin_code
      rand(1000..9999)
    end
end