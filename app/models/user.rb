class User < ActiveRecord::Base
  TEMP_EMAIL_PREFIX = 'change@me'
  TEMP_EMAIL_REGEX = /\Achange@me/
  has_many :items
  
  devise :database_authenticatable, :omniauthable, :registerable, 
         :confirmable, :recoverable, :rememberable, :trackable, :validatable

  validates :email, format: { without: TEMP_EMAIL_REGEX }, on: :update

  accepts_nested_attributes_for :items

  def self.find_for_oauth(auth, signed_in_resource = nil)
    identity = Identity.find_for_oauth(auth)
    user = signed_in_resource ? signed_in_resource : identity.user
    if user.nil?
      #get existing user by email if the provider gives a verified email
      #if no verified email, assign a temporary email and ask for verification
      email_is_verified = auth.info.email && (auth.info.verified || auth.info.verified_email)
      email = auth.info.email if email_is_verified
      user = User.where(email: email).first if email

      #create user if it a new registration
      if user.nil?
        user = User.new(
          email: email ? email : "#{TEMP_EMAIL_PREFIX}-#{auth.id}-#{auth.provider.com}",
          password: Devise.friendly_token[0,20]
        )
        user.skip_confirmation!
        user.save!
      end
    end

    if identity.user != user
      identity.user = user
      identity.save!
    end
    user
  end

  def email_verified?
    self.email && self.email !~ TEMP_EMAIL_REGEX
  end
  
end
