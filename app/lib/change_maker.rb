module ChangeMaker
  DENOM = {
    usd: {"dollar" => 100,
          "quarter" => 25,
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


  def self.calculate_change(denomination, dollar_amount)
    DENOM[denomination].reduce({}) do |acc, (name, value)|
      acc[name], dollar_amount = dollar_amount.divmod(value)
      acc
    end
  end

  def self.format_dollar_input(input)
    if input.include?('.')
      input.gsub(/\D/, "").to_i
    else
      input.gsub(/\D/, "").to_i * 100
    end
  end

  def self.validate_dollar_input(input)
    input.match?(/^[$|€]?([0-9]{1,3}(?:,?[0-9]{3})*(?:\.[0-9]{2})?$)|[.]{\d{2}/)
  end
end
