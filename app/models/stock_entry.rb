class StockEntry < ApplicationRecord
  belongs_to :item
  validates :quantity, presence: true
  after_save :update_stock

  def update_stock
    self.item.stock += self.quantity
    item.save
  end


end
