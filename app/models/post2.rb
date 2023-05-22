class Post2 < ApplicationRecord

    has_secure_password

    validates :content, {presence: true}
    
end
