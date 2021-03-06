class Seller < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, password_length: 8..128

  has_many :products, dependent: :destroy
  has_attached_file :avatar, styles: {
    thumb: '24x24>',
    square: '200x200#',
    medium: '300x300>'
  }, default_url: "/images/:style/missing.png"

  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  validates :company, presence: true
  validates :avatar, presence: true
end
