require 'rails_helper'

RSpec.describe Store::LineItem, :type => :model do
  describe "associations" do
    it { is_expected.to belong_to :product }
    it { is_expected.to belong_to :cart }
    it { is_expected.to belong_to :order }
  end

  describe "validations" do
    it do
      # is_expected.to validate_numericality_of(:quantity).is_less_than_or_equal_to(:remaining_product_quantity)
    end
  end
end
