class Post < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy

  def average
    reviews.average(:rating).to_f
  end
end
