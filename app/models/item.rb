require 'csv'

class Item < ApplicationRecord
  has_many :stock_entries, dependent: :destroy
  has_many :stock_removals, dependent: :destroy
  has_one_attached :image

  validates :name, :internal_code, presence: true

  def self.to_csv
    items = all
    CSV.generate do |csv|
      csv << column_names
      items.each do |item|
        csv << item.attributes.values_at(*column_names)
      end
    end
end

end
