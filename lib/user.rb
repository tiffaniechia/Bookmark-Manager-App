require 'bcrypt' #bcrypt will generate a password hash

class User

    include DataMapper::Resource

    property :id, Serial
    property :email, String
    property :password_digest, Text

    def password=(password)
      self.password_digest = BCrypt::Password.create(password)
    end  

end  