class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
attachment :profile_image

# 記事とユーザーの関係1:N
has_many :topics

# グッド機能
has_many :topics, dependent: :destroy
has_many :topic_goods, dependent: :destroy
has_many :good_posts, through: :topic_goods, source: :post
def already_topic_good?(topic)
	self.topic_goods.exists?(topic_id: topic.id)
end

# バッド機能
has_many :topics, dependent: :destroy
has_many :topic_bads, dependent: :destroy
has_many :bad_posts, through: :topic_bads, source: :post
def already_topic_bad?(topic)
	self.topic_bads.exists?(topic_id: topic.id)
end

#コメント機能
# has_many :topics すでに定義済み
has_many :topic_comments, dependent: :destroy


# クリップ機能
has_many :clips
has_many :clip_topics, through: :clips, source: :topic

# フォロー機能
has_many :following_relationships, foreign_key: "follower_id", class_name: "Relationship", dependent: :destroy

 has_many :followings, through: :following_relationships

 has_many :follower_relationships, foreign_key: "following_id", class_name: "Relationship", dependent: :destroy

 has_many :followers, through: :follower_relationships

  def following?(other_user)
    following_relationships.find_by(following_id: other_user.id)
  end

  def follow!(other_user)
    following_relationships.create!(following_id: other_user.id)
  end

  def unfollow!(other_user)
    following_relationships.find_by(following_id: other_user.id).destroy
  end

end
