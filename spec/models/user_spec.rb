require 'rails_helper'

RSpec.describe User, :type => :model do

  describe "Initialise" do
    it "creates a new user" do
      user = User.new(user_name: "mr_cat", email: "puss@boots.com", password:"catsrule&dogsdrool")
      expect(user.user_name).to eq("mr_cat")
    end
  end

  describe "Validations" do

    it "creates a valid user" do
      user = User.new(user_name: "mr_cat", email: "puss@boots.com", password:"catsrule&dogsdrool")
      expect(user.valid?).to eq(true)
    end

    it "rejects a user with a short password (DEVISE)" do
      user = User.new(user_name: "mr_cat", email: "puss@boots.com", password:"cats")
      expect(user.valid?).to eq(false)
    end

    it "rejects a user with a short username" do
      user = User.new(user_name: "cat", email: "puss@boots.com", password:"catsrule&dogsdrool")
      expect(user.valid?).to eq(false)
    end

  end

end
