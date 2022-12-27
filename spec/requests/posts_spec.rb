require "rails_helper"

RSpec.describe "Posts", type: :request do
  # This test is checking the length of my array of posts.
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
  #This tests if I can get something specific based on ID and return the right info
  describe "GET /posts/:id" do
    it "should pull up a specifc posts based on the id param" do
      user = User.create!(name: "Sara", email: "sara@test.com", password: "password")
      Post.create!(title: "Post", body: "text", image: "sample", user_id: user.id)
      post_id = Post.first.id
      get "/posts/#{post_id}.json"
      post = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(post["title"]).to eq("Post")
      expect(post["body"]).to eq("text")
      expect(post["image"]).to eq("sample")
    end
  end
end
