require 'rails_helper'
RSpec.describe Order, type: :model do
  describe"scopes" do
    describe ".cancelled" do
      cancelled_order = create(:order, cancelled: true)
      active_order = create(:order)

      result = Order.cancelled

      expect(result).to include(cancelled_order)
      expect(result).not_to include(active_order)
    end
  end

  describe"scopes" do
    describe ".active" do
      it "returns only orde that are not cancelled" do
      create(:order, cancelled: false)
      active_order = create(:order, cancelled: false)
  
  
      
      expect(Order.active).to eq([active_order])
    end
  end