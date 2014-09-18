require 'rails_helper'

RSpec.describe PostsController, :type => :controller do

  describe "GET index" do
    it "redirects to the posts index template" do
      get :index
      expect(response).to render_template("index")
    end

    it "stores all the posts in an instance variable" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "#show" do
    pending
  end

  describe "#create" do
    pending
  end

  describe "#destroy" do
    pending
  end

  describe "#edit" do
    pending
  end



end
