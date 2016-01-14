class User

  include DataMapper::Resource

  property :id,       Serial
  property :username, String, required: true, unique: true
  property :email,    String, required: true, unique: true,
                              format: :email_address,
                              messages: {
                                is_unique: 'Email address already registered'
                              }
  property :password, BCryptHash, required: true

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

end
