module SavingsAccount
  def self.interest_rate(balance)
    percentage(balance)
  end

  def self.annual_balance_update(balance)
    balance + ((balance * percentage(balance)) / 100.0)
  end

  def self.years_before_desired_balance(current_balance, desired_balance)
    total_balance = current_balance
    count = 0
    while total_balance <= desired_balance
      total_balance = annual_balance_update(total_balance)
      count += 1
    end
    count
  end

  def self.percentage(saldo)
    case
    when saldo < 0.0 then 3.213
    when saldo >= 5000.0 then 2.475
    when saldo >= 1000.0 then 1.621 # with also && saldo < 5000.0
    when saldo < 1000.0 then 0.5
    end
  end

  private_class_method :percentage
end
