class Market < ApplicationRecord
  before_save { |market| market.vendor_count = count_vendors }

  private

    def count_vendors
      vendors.count
    end
end