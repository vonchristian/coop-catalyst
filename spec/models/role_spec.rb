require 'rails_helper'

RSpec.describe Role, :type => :model do
  describe "association" do
    it { is_expected.to belong_to :user }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of :role }
  end
end
