require 'rails_helper'

RSpec.describe Store::Order, :type => :model do
  describe "associations" do
    it { is_expected.to belong_to :customer }
    it { is_expected.to have_many :line_items }
  end
end
