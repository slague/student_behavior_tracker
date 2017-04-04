require 'rails_helper'

describe Observation do
  describe "validations" do
    context "invalid attributes" do
      it { is_expected.to validate_presence_of(:keyword)}
    end


  end
end
