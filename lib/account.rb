require 'date'

class Account 
    STANDARD_VALIDITY_YRS = 5

    attr_accessor  :exp_date, :account_status, :pin_code, :balance, :account_owner
   
    def initialize
        @account_owner = 'Paulo'
        @balance = 1000
        @exp_date = '10/25'
        @account_status = :active
        pin_code = '1234'
    end

  def set_expire_date
    Date.today.next_year(STANDARD_VALIDITY_YRS).strftime('%m/%y')
  end

  def deactivate
    @account_status = :deactivated
  end

end