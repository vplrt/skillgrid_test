class Admin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, password_length: 10..128

  has_attached_file :avatar, styles: {
    thumb: '24x24>',
    square: '200x200#',
    medium: '300x300>'
  }, default_url: "/images/:style/missing.png"

  has_attached_file :passport, styles: {
    medium: '300x300>'
  }, default_url: "/images/:style/missing.png"

  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  validates_attachment_content_type :passport, :content_type => /\Aimage\/.*\Z/
  validates :avatar, presence: true
  validates :passport, presence: true

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :birthday, presence: true
end
