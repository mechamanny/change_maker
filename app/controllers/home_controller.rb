class HomeController < ApplicationController
  require 'change_maker'

  def index
  end

  def make_change
    if ChangeMaker.validate_dollar_input(params[:money_value])
      @change = ChangeMaker.calculate_change(params[:denom].to_sym, ChangeMaker.format_dollar_input(params[:money_value]))
      respond_to do |format|
        format.js
      end
    end
  end
end
