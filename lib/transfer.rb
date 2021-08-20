class Transfer

  attr_accessor :status, :sender, :receiver, :amount

  def initialize(sender, receiver, amount)
    @status = "pending"
    @amount = amount
    @sender = sender 
    @receiver = receiver
  end

  def valid? 
    if sender.valid? && receiver.valid? 
      true 
    else 
      false 
    end
  end

  def execute_transaction
    if valid? && @sender.balance > @amount && @status == "pending"
      @sender.balance -= @amount
      @receiver.deposit(@amount)
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if execute_transaction 
      @receiver.balance -= @amount 
      @sender.deposit(@amount)
      @status = "reversed"
    else
      false
    end
  end
  




  # your code here
end
