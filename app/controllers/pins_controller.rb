class PinsController < ApplicationController
  before_action :find_pin, only: [:show, :edit, :update, :destroy]

  def create
    @pin = current_user.pins.build(pin_params)
    if @pin.save
      redirect_to @pin, notice: "Pin saved successfully"
    else
      render 'new'
    end
  end

  def destroy
    @pin.destroy
    redirect_to root_path
  end

  def edit
    
  end

  def index
    @pins = Pin.all.order("created_at DESC")
  end

  def new
    @pin = current_user.pins.build
  end

  def update
    if @pin.update(pin_params)
      redirect_to @pin, notice: "Pin updated successfully"
    else
      render 'edit'
    end
  end

  def show
  end

  private

  def pin_params
    params.require(:pin).permit(:title, :description, :image)
  end

  def find_pin
    @pin = Pin.find(params[:id])
  end
end
