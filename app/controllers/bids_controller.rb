class BidsController < ApplicationController

  def create
    @bid = Bid.new(bid_params)
    @bids = Bid.all
    @bid.save
    @item = @bid.item
  end

  def show
    @bid = Bid.new(bid_params)

    if @bid.save
      @bids = Bid.all
    else
      @item = @bid.item
      render "items/show"
    end
  end


  private
    # Only allow a trusted parameter "white list" through.
    def bid_params
      params.require(:bid).permit(:amount, :item_id)
    end
end
