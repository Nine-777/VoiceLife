# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  image_name             :string(255)
#  name                   :string(255)
#  password               :string(255)
#  password_confirmation  :string(255)
#  password_digest        :string(255)
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :name, {presence: true}
  validates :email, {presence: true, uniqueness: true}
  # validates :password, {presence: true}
  has_secure_password
  # devise :database_authenticatable
  has_many :posts, dependent: :destroy   
  
  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "ゲスト"
      image_name = "999"
    end
  end

  # def posts
  #   return Post.where(user_id: self.id)
  # end

end
