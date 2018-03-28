class Topic < ApplicationRecord
#カウンティング用
is_impressionable
attachment :topic_image

# 記事とユーザーの関係1:N
belongs_to :user

# グッド機能
has_many(:topic_goods, {:dependent => :delete_all})
has_many :good_users, through: :topic_goods, source: :user

# バッド機能
has_many :topic_bads, dependent: :delete_all
has_many :bad_users, through: :topic_bads, source: :user

#コメント機能
belongs_to :user
has_many :topic_comments, dependent: :destroy

#カテゴリー
has_many :topic_categories
has_many :categories, :through => :topic_categories

#タグ機能
has_many :tags, inverse_of: :topic
accepts_nested_attributes_for :tags, allow_destroy: true

# クリップ機能
has_many :clips
has_many :users, through: :clips


  def is_new
    (3.days.ago..Time.current).cover?(Time.parse(self.created_at.to_s))
    # (1.minutes.ago..Time.current).cover?(Time.parse(self.created_at.to_s))
  end


  def self.search(search)
      if search.present?
        # binding.pry
        relation = Topic.joins(:tags)
        relations = relation.joins(:categories)
        relations.merge(Category.where(['category_name LIKE ?', "%#{search}%"])).or(relations.where(['tag_name LIKE ?', "%#{search}%"])).or(relations.where(['body LIKE ?', "%#{search}%"])).or(relations.where(['re_body LIKE ?', "%#{search}%"])).or(relations.where(['title LIKE ?', "%#{search}%"])).uniq
      else
        Topic.all
      end
  end

  def percentage
    total_count = self.bad_count + self.good_count
    return ((self.good_count.to_f.round(1)/ total_count.round(1) ) * 100).round(1)
  end



end
