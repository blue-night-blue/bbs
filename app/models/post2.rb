class Post2 < ApplicationRecord

    has_secure_password

    validates :content, {presence: true}
    
    #以下、Progate参考。インスタントメソッドを使いたい時に。
    #def user
    #    return User.find_by(post_id: self.user_id)
    #end

end
