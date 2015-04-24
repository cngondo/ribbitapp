class User < ActiveRecord::Base
  before_save :create_avatar_url
  #Deprecated in rails 4.x.x and above
  #attr_accessible :avatar_url, :email, :name, :password, :password_confirmation, :username
  #The gem bcrypt works with the following line of code to encrypt the password
  has_secure_password
  before_validation :prep_email
  #These are the validations to contraint the user
  validates :name, presence: true
  validates :username, uniqueness: true, presence: true
  validates :email, uniqueness: true, presence: true, format: { with: /\A^[\w.+-]+@([\w]+.)+\w+$\z/ }

  #Method that takes up the email to match with the avatar image
  private
    def prep_email
        self.email = self.email.strip.downcase if self.email
    end

    def create_avatar_url
      self.avatar_url = "http://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(self.email)}?s=50"
    end


end
