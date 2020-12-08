class User < ApplicationRecord

    has_many :posts
    has_many :comments
    has_many :commented_posts, through: :comments, source: :post 
    has_many :categories, through: :posts
    has_secure_password 

    PASSWORD_REQUIREMENTS = /\A 
        (?=.{12,}) # At least 12 characters long
        (?=.*\d) # Must contain at least one number
        (?=.*[a-z]) # Must contain at least one lowercase letter
        (?=.*[A-Z]) # Must contain at least one uppercase letter
        (?=.*[[:^alnum:]]) # Must contain at least one symbol
    /x
    
    validates :username, presence: true
    #validates :password, format: PASSWORD_REQUIREMENTS
    ## this breaks my google omniauth sign up - add this feature later

end
