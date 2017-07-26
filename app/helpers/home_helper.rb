module HomeHelper
  DENOM = {
    usd: {"quarter" => 25,
          "dime" => 10,
          "nickel" => 5,
          "penny" => 1},

    euro: {"2 euro" => 200,
           "1 euro" => 100,
           "50 cents" => 50,
           "20 cents" => 20,
           "10 cents" => 10,
           "5 cents" => 5,
           "2 cents" => 2,
           "1 cent" => 1}
  }


  def calculate_change(denomination, dollar_amount)
    coin_hash = DENOM[denomination].clone
    coin_amounts = coin_hash.clone
    coin_amounts.each { |name, value| coin_amounts[name] = 0}

    coin_hash.reduce(dollar_amount) do |remaining_money, (name, coin_value)|
      coin_hash[name] = remaining_money / coin_value
      remaining_money % coin_value
    end
    coin_hash
  end
end
