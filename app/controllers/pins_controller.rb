class PinsController < ApplicationController
  def index
  end

  def create
    @pin = Pin.new(pin_params)
  end

  def new
    @pin = Pin.new  
  end

  private

  def pin_params
    params.require(:pins).permit(:title, :description)
  end
end
