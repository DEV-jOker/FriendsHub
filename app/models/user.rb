class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  include Gravtastic
  gravtastic

  has_many :friendships
  has_many :friends, through: :friendships  

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  def self.search_users(search_string)
    users_arr = (User.where("name LIKE ?","%#{search_string}%")+User.where("email LIKE ?","%#{search_string}%")).uniq
  end

  def is_a_friend?(friend)
    self.friends.include?(friend)
  end
  

  def followed
    followed_arr = Friendship.where(friend_id:self.id).map{|object| User.find(object.user_id)}
  end
    
        
end
