class Post < ApplicationRecord
  default_scope -> {order(updated_at: :desc)}
  belongs_to :user
  validates :tweet, presence: true,length: {minimum:6,maximum: 200}
end
