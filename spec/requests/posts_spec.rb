require "rails_helper"

RSpec.describe "Posts", type: :request do
  describe "GET /posts" do
    it "should load all my posts" do
      user = User.create!(name: "Sara", email: "sara@test.com", password: "password")
      Post.create!(title: "Post", body: "text", image: "sample", user_id: user.id)
      Post.create!(title: "Post", body: "text", image: "sample", user_id: user.id)
      Post.create!(title: "Post", body: "text", image: "sample", user_id: user.id)
      Post.create!(title: "Post", body: "text", image: "sample", user_id: user.id)

      get "/posts.json"
      posts = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(posts.length).to eq(4)
    end
  end
end

# This test is checking the length of my array of posts.
