class User < ActiveRecord::Base
  has_many :topic
  has_many :subject
  has_many :message
  has_many :comment
  has_one :mark

	before_create :check_email
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :pin, length: { is: 10 }, numericality: { only_integer: true }, uniqueness: true, if: :pin?
  validates :faculty_number, length: { is: 9 }, numericality: { only_integer: true }, uniqueness: true, presence: false, if: :faculty_number?

  def full_name
    [first_name, last_name].join(' ')
  end

  def professor?
    self.role == 'professor'
  end

  private

  def pin?
    pin.present?
  end

  def faculty_number?
    faculty_number.present?
  end

  def check_email
  	if self.role == '1' && self.email.split('@').last == 'gmail.com'
  		self.role = 'professor'
  	else
  		self.role = 'student'
  	end
  end
end
