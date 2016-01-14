class User

  include DataMapper::Resource

  property :id,                  Serial
  property :username,            String, required: true, unique: true
  property :email,               String, required: true, unique: true,
                                         format: :email_address,
                                         messages: {
                                        is_unique: 'Email address already registered'
                                        }
  property :password,            BCryptHash, required: true
  property :password_token,      String
  property :password_token_time, Time

  attr_accessor :password_confirmation
  validates_confirmation_of :password,
                            message: 'Password and confirmation do not match'

  def self.authenticate(email, password)
    user = first(email: email)
    if user && BCrypt::Password.new(user.password) == password
      user
    else
      nil
    end
  end

  def generate_token
    self.password_token = SecureRandom.hex
    self.password_token_time = Time.now
    self.save
  end

end
