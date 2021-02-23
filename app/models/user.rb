class User < ApplicationRecord
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # has_many :items
  # has_many :comments
  # has_many :item_purchases

  with_options presence: true do
    validates :nickname     
    validates :first_name, format: {with: /\A[ぁ-んァ-ン一-龥々]+\z/ }          
    validates :last_name, format: {with: /\A[ぁ-んァ-ン一-龥々]+\z/ }           
    validates :first_name_furigana, format: {with: /\A[ァ-ヶー－]+\z/ }
    validates :last_name_furigana, format: {with: /\A[ァ-ヶー－]+\z/ }
    validates :date_of_birth
  end  
  
  validates :password, length: {minimum:6, message: "Password is too short (minimum is 6 characters)"}
  validates :password, format:{with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,}/, message: "Include both letters and numbers" }

end
