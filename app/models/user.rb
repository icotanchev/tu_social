class User < ActiveRecord::Base
  has_many :topic

	before_save :check_email
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # attr_accessible :email, :first_name, :last_name, :password, :password_confirmation#, :role, :pin, :faculty_number, :send_emails

  def full_name
    [first_name, last_name].join(' ')
  end

  def professor?
    self.role == 'professor'
  end

  private

  def check_email
  	if self.role == '1' && self.email.split('@').last == 'gmail.com'
  		self.role = 'professor'
  	else
  		self.role = 'student'
  	end
  end
end
