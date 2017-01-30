class User < ActiveRecord::Base
   has_many :posts
   has_many :comments

   has_many :posts, dependent: :destroy
   has_many :comments, dependent: :destroy
   has_many :votes, dependent: :destroy
   has_many :favorites, dependent: :destroy

   before_save { self.email = email.downcase }
   before_save { self.role ||= :member }

   validates :name, length: { minimum: 1, maximum: 100 }, presence: true

   validates :email,
             presence: true,
             uniqueness: { case_sensitive: false },
             length: { minimum: 3, maximum: 254 }
   validates :password, presence: true, length: { minimum: 6 }, if: "password_digest.nil?"
   validates :password, length: { minimum: 6 }, allow_blank: true

   has_secure_password

   enum role: [:member, :admin]

   def favorite_for(post)
     favorites.where(post_id: post.id).first
   end

     def avatar_url(size)
       gravatar_id = Digest::MD5::hexdigest(self.email).downcase
       "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}"
     end

     def fav_post_user_gravatar(post_id)
    user_post = Post.where(id: post_id)
    user_post_id = user_post.first.user_id
    @gravatar_user = User.where(id: user_post_id)
    gravatar_email = @gravatar_user.first.email
    gravatar_id = Digest::MD5::hexdigest(gravatar_email).downcase
    "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{72}"
   end
   
   end
