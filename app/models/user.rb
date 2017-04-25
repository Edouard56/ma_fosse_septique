class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :company, presence: :true
  validates :address, presence: :true
  validates :mobile_phone, presence: :true
  # validates :description, presence: :true
  # validates :radius, presence: :true

end
