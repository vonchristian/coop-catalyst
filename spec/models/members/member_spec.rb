require 'rails_helper'

RSpec.describe Member, :type => :model do
  describe "associations" do
    it { is_expected.to have_one :occupation }
  end

  describe "nested_attributes" do
    it { is_expected.to accept_nested_attributes_for :occupation }
  end

  describe "delegations" do
    it { is_expected.to delegate_method(:position).to(:occupation)}
  end
end
 
