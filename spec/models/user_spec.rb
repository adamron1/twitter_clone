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

    describe "user_name too small:" do
      before do
        @user = User.new(user_name: "cat", email: "puss@boots.com", password:"catsrule&dogsdrool")
      end

      it "rejects a new user with a short username (under 4 characters)" do

        expect(@user.valid?).to eq(false)
      end

      it "gives a pointed error message" do
        @user.valid?
        expect(@user.errors.messages[:user_name]).to eq(["is too short (minimum is 4 characters)"])
      end

    end

    describe "user_name too big" do
      before do
        @user = User.new(user_name: "mr_really_big_and_strong_cat", email: "puss@boots.com", password:"catsrule&dogsdrool")
      end

      it "rejects a new user with a long username (over 20 characters)" do
        expect(@user.valid?).to eq(false)
      end

      it "rejects a new user with a long username (over 20 characters)" do
        @user.valid?
        expect(@user.errors.messages[:user_name]).to eq(["is too long (maximum is 20 characters)"])
      end
    end

    describe "uniqueness" do

      before do
        @first_user = User.create(user_name: "mr_cat", email: "puss@boots.com", password:"catsrule&dogsdrool")
      end

      it "only allows a unique user_name" do
        copycat = User.new(user_name: "mr_cat", email: "pusspuss@boots.com", password:"catsrule&dogsdrool")
        expect(copycat.valid?).to eq(false)
      end

      it "only allows a unique email address" do
        copycat = User.new(user_name: "mr_big_cat", email: "puss@boots.com", password:"catsrule&dogsdrool")
        expect(copycat.valid?).to eq(false)
      end
    end

  end

end
