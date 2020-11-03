class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category
  
  has_many :comments, dependent: :destroy #whenever you delete a post this will delete all of the posts comments too
  has_many :users, through: :comments

  validates :content, :title, presence: true

  validate :too_many_posts

  scope :alpha, -> { order(:title)} #orders anything it is called on alphabetically
  scope :most_comments, -> {left_joins(:comments).group('posts.id').order('count(comments.post_id) desc')}
  

  def category_attributes=(attr)
    self.category = Category.find_or_create_by(attr) if !attr[:name].blank?
  end 

  def too_many_posts
    
    todays_posts = user.posts.select do |p|
      p.created_at.try(:to_date) == Date.today
    end 

    if todays_posts.size > 1
      errors.add(:post_id, "can't be posted more than 2 times per day!")
    end

  end 

end

