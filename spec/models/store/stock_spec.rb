require 'rails_helper'

RSpec.describe Store::Stock, :type => :model do
  describe "associations" do
    it { is_expected.to belong_to :product }
  end
  describe "validations" do
    it { is_expected.to validate_presence_of :quantity }
    it { is_expected.to validate_presence_of :date }
    it do
      is_expected.to validate_numericality_of(:quantity).is_greater_than(0.1)
    end
  end

end
