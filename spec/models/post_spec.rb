require 'rails_helper'

RSpec.describe Post, type: :model do
  it 'has a valid factory' do
    expect(build(:post)).to be_valid
  end

  it 'is invalid without a title' do
    expect(build(:post, title: nil)).to_not be_valid
  end

  it 'is invalid without a body' do
    expect(build(:post, body: nil)).to_not be_valid
  end

  it 'calculates the average rating' do
    post = create(:post)
    create(:review, post: post, rating: 3)
    create(:review, post: post, rating: 5)
    expect(post.average_rating).to eq(4.0)
  end
end
