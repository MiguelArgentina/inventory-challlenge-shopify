class StocksController < ApplicationController

  def edit
    @item = Item.find_by(id: params[:id])
    @action = 'add' if params[:add_stock]
    @action = 'remove' if params[:remove_stock]
  end

  def update
    item = Item.find_by(id: params[:id])
    quantity = params[:stock].to_i
    if (item.stock - quantity).negative? && params[:remove]
      flash[:error] = "Quantity exceeds current stock"
      redirect_to edit_stock_path(item, remove_stock: 'true' )
    else
      add_stock_to(item: item, quantity: quantity) if params[:add]
      remove_stock_from(item: item, quantity: quantity) if params[:remove]
      redirect_to item_path(item), notice: "Stock updated succesfullyy"
    end
  end

  private
  def stock_params
    params.require(:item).permit(:stock_action, :add, :remove)
  end

  def add_stock_to(item:, quantity:)
    item.stock_entries.create(quantity: quantity)
  end

  def remove_stock_from(item:, quantity:)
    item.stock_removals.create(quantity: quantity)
  end
  
end
