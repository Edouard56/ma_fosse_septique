class User < ApplicationRecord
  has_attachment :photo_presentation
  has_attachment  :photo_company_logo
  has_attachments :photos_projet_1, maximum: 3
  has_attachments :photos_projet_2, maximum: 3
  has_attachments :photos_projet_3, maximum: 3
  has_attachments :photos_projet_4, maximum: 3

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
  validates :radius, presence: :true

end
