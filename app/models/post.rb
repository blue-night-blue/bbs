class Post < ApplicationRecord
    has_secure_password

    validates :content, {presence: true}


end
