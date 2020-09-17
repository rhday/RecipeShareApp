Recipe Sharing app

Post
- belongs_to :user
- has_many :comments
- has_many :users, through: :comments
- belongs_to :category
- Title
- Recipe

User
- has_many :posts
- has_many :comments
- has_many :posts, through: :comments
- has_many :categories, through: :posts
- username
- email
- password_digest

Comment
- belongs_to :user
- belongs_to :post
- content


**Potential Build after MVPmet**
Category 
- Name
- has_many :posts
- has_many :users, through: :posts