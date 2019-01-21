class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :organization
  has_many :commitments
  has_many :suppliers, through: :commitments

  def name
    "#{first_name} #{last_name}"
  end



end
