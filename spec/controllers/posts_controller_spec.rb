require 'rails_helper'

RSpec.describe PostsController, :type => :controller do

  before do
    @test = create :post
  end

  describe "GET #index" do
    it "redirects to the posts index template" do
      get :index
      expect(response).to render_template("index")
    end

    it "stores all the posts in an instance variable" do
      get :index
      expect(assigns(:posts)).to match_array([@test])
    end
  end

  describe "GET #show" do

    it "assigns the requested post to @post" do
      get :show, id: @test
      expect(assigns(:post)).to eq(@test)
    end

    it "redirects to a show template" do
      get :show, id: @test
      expect(response).to render_template("show")
    end

  end

  describe "POST #create" do

    context 'with valid attributes' do
      it "creates a new post object" do
        expect{
          post :create, post: FactoryGirl.attributes_for(:post)
        }.to change(Post,:count).by(1)
      end

      it "redirects to the new post's view" do
        post :create, post: FactoryGirl.attributes_for(:post)
        expect(response).to redirect_to(Post.last)
      end
    end

  end

  describe "DELETE #destroy" do

    it "annihilates an unsuspecting post" do
      expect{
        delete :destroy, id: @test
      }.to change(Post,:count).by(-1)
    end

    it "redirects to posts index" do
      delete :destroy, id: @test
      expect(response).to redirect_to posts_path
    end
  end

  describe "GET #edit" do

    it "gets the correct Post object" do
      get :edit, id: @test
      expect(assigns(:post)).to eq(@test)
    end

  end

end
