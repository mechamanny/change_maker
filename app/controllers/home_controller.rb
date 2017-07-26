class HomeController < ApplicationController
  def index
  end

  def make_change
    @change = helpers.calculate_change(params[:denom].to_sym, params[:money_value].to_i)
    respond_to do |format|
      format.js
    end
  end
end
