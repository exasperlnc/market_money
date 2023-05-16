class Market < ApplicationRecord
  # before_save { |market| market.vendor_count = vendor_count }
  has_many :market_vendors
  has_many :vendors, through: :market_vendors


  def vendor_count
    vendors.count
  end
end