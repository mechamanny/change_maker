class HomeController < ApplicationController
  include ChangeMaker
  def index
  end

  def make_change
    if ChangeMaker.validate_dollar_input(params[:money_value])
      respond_to do |format|
        @change = ChangeMaker.calculate_change(params[:denom].to_sym, ChangeMaker.format_dollar_input(params[:money_value]))
        format.js
      end
    end
  end
end
