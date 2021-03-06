class Interviewer < ActiveRecord::Base
	has_many :applications

	email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	attr_accessible :name, :position, :email, :password, :password_confirmation
  
  has_secure_password

	  validates :name,	:presence => true,
					:length => { :maximum => 50 }
          
    before_save :encrypt_password

	  validates :password,	:presence => true,
	  						:confirmation => true,
	  						:length => { :within => 6..40 }

	  validates :email, :presence => true,
					:format => { :with => email_regex },
					:uniqueness => true


    def has_password?(submitted_password)
      encrypted_password == encrypt(submitted_password)
    end
    private
      def encrypt_password
        self.salt = make_salt if new_record?
        self.encrypted_password = encrypt(password)
      end
      def encrypt(string)
        secure_hash("#{salt}--#{string}")
      end
      def make_salt
        secure_hash("#{Time.now.utc}--#{password}")
      end
      def secure_hash(string)
        Digest::SHA2.hexdigest(string)
      end
    

end
