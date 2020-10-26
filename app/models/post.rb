class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category
  
  has_many :comments
  has_many :users, through: :comments

  validates :content, :title, presence: true

  scope :alpha, -> { order(:title)} #orders anything it is called on alphabetically
  scope :most_comments, -> {left_joins(:comments).group('posts.id').order('count(comments.post_id) desc')}
  

  def category_attributes=(attr)
    self.category = Category.find_or_create_by(attr) if !attr[:name].blank?
  end 

end

