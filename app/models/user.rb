class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  mount_uploader :image, ImageUploader
  has_many :posts, dependent: :destroy
  validates :name, presence: true
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_posts, through: :likes, source: :post
  has_many :comment, dependent: :destroy
  def update_without_current_password(params, *options)
	  params.delete(:current_password)

	  if params[:password].blank? && params[:password_confirmation].blank?
	  	params.delete(:password)
	  	params.delete(:password_confirmation)
	  end

	  result = update_attributes(params, *options)
	  clean_up_passwords
	  result
  end

  def already_liked?(post)
    self.likes.exists?(post_id: post.id)
  end
end
