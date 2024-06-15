require 'rails_helper'

RSpec.describe "Posts", type: :request do
  describe "GET /user_posts" do
    it "returns user posts with pagination" do
      user = create(:user)
      create_list(:post, 15, user: user)
      get user_posts_user_posts_path(user_id: user.id, page: 1)
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body).size).to eq(10)
    end
  end

  describe "GET /top_posts" do
    it "returns top posts with pagination" do
      user = create(:user)
      create_list(:post, 15, user: user)
      get top_posts_user_posts_path(page: 1)
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body).size).to eq(10)
    end
  end
end
