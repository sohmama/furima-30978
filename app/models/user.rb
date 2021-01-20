class User < ApplicationRecord
  validates :nickname, presence: true
  validates :first_name, presence: true
  validates :last_name, presemce: true
  validates :first_name_furigana, presence: true
  validates :last_name_furigana, presence: true
  validates :date_of_birth, presence: true 
end
