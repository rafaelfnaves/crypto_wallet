class Api::V1::CoinsController < ApplicationController
  # GET /api/v1/coins
 
 def index
 
  @coins = Coin.all
    render json: @coins
  end

  # GET /api/v1/coins/1
  def show
    render json: @coin
  end

  # DELETE /api/v1/coins/1
  # def destroy
  #   @coin.destroy
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_coin
      @coin = Coin.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    # def coin_params
    #   params.require(:coin).permit(:)
    # end
end