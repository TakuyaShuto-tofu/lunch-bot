class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    mount_uploader :profile_image, ProfileImageUploader

  has_many :stores, dependent: :destroy
  #フォローをした、されたの関係
  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy

  #一覧画面で使う
  has_many :followings, through: :relationships, source: :followed, dependent: :destroy
  has_many :followers, through: :reverse_of_relationships, source: :follower, dependent: :destroy

  #フォローした時の処理
  def follow(user)
    relationships.create(followed: user)
  end
  #フォローを外す時の処理
  def unfollow(user)
    followings.delete(user)
  end
  #フォローしているか判定
  def following?(user)
    followings.include?(user)
  end

end
