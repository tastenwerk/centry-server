require 'spec_helper'

describe Organization do

  describe "users membership" do
  
    let!(:user){ create(:user) }
    let!(:organization){ create(:organization) }

    it { expect(user.organizations.size).to be 0 }

    it "has a member" do
      user.organizations << organization
      expect( user.organizations.size ).to be 1
    end

  end

end
