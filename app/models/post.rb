class Post < ApplicationRecord
    validates :content, {presence: true, length: {maximum: 100}}
    validates :user_id, {presence: true}
    mount_uploader :file, AudiofileUploader

    def user
        return User.find_by(id: self.user_id)
    end

end
