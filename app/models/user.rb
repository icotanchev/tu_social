class User < ActiveRecord::Base
  has_many :topic
  has_many :subject
  has_many :message
  has_one :mark

	before_save :check_email
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :pin, length: { is: 10 }, numericality: { only_integer: true }
  validates :faculty_number, length: { is: 9 }, numericality: { only_integer: true }

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
