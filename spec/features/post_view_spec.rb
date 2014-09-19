require 'rails_helper'

describe "the posts view process", :type => :feature do
  before :each do
    User.make(email: 'user@example.com', password:'caplin')
    Post.make(content: "This is such a post", user_id: 1)
  end

  it "shows the index page with a bunch of mean as posts" do

  end

end
