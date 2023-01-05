class Store < ApplicationRecord

  belongs_to :user 

  validates :comment, presence: { message: '１文字以上入力してください。' }

  default_scope -> { order(created_at: :desc) }

end
