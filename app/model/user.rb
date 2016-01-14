class User

  include DataMapper::Resource

  property :id,       Serial
  property :username, String, required: true, unique: true
  property :email,    String, required: true, unique: true, format: :email_address
  property :password, BCryptHash, required: true

  attr_accessor :password_confirmation
  validates_confirmation_of :password,
                            message: 'Password and confirmation do not match'

end
