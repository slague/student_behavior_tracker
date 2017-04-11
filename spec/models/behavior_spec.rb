require 'rails_helper'

describe Observation, type: :model do
  describe "validations" do
    context "invalid attributes" do
      it { should validate_presence_of(:keyword)}
    end


  end
end
