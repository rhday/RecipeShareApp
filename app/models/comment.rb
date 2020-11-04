class Comment < ApplicationRecord
    belongs_to :post
    belongs_to :user

    validates  :content, presence: true

    validates :post, uniqueness: { scope: :user_id, message: "can only be commented on once!"}

    scope :alpha, -> { order(:content)}

end
