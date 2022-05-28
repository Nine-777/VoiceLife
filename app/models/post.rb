# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  content    :text(65535)
#  file       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
class Post < ApplicationRecord
    validates :content, {presence: true, length: {maximum: 100}}
    validates :user_id, {presence: true}
    mount_uploader :file, AudioUploader

    belongs_to :user

    def user
        return User.find_by(id: self.user_id)
    end

end
