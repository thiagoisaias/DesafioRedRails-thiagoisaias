class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  validates :name, presence: true
  
  has_many :posts, dependent: :destroy
  has_many :active_relationships, class_name: 'Relationship', foreign_key: 'follower_id', dependent: :destroy
  has_many :passive_relationships, class_name: 'Relationship', foreign_key: 'followed_id', dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  default_scope -> { order(created_at: :desc) }

  def follow(other_user)
    following << other_user
  end

  def following?(other_user)
    following.include? other_user
  end

  def unfollow(other_user)
    following.delete other_user
  end

  def feed
    Post.where("user_id IN (?) OR user_id = (?)", following_ids, id)
  end
  
end
