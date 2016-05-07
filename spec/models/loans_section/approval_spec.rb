require 'rails_helper'

RSpec.describe LoansSection::Approval,:type => :model do
  describe "associations" do
    it { is_expected.to belong_to :loan }
    it { is_expected.to belong_to :approver }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of :date }
  end

end
