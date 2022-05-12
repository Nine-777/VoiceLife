# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string(255)
#  encrypted_password     :string(255)      default(""), not null
#  image_name             :string(255)
#  name                   :string(255)
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
    has_secure_password
    validates :name, {presence: true}
    validates :email, {presence: true, uniqueness: true}

    def posts
        return Post.where(user_id: self.id)
    end

end
