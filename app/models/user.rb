class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :nickname, presence: true
         validates :last_name, presence: true, format: { with: /\A[^\p{ascii}]*\z/, message: "is invalid. Input full-width characters" }
         validates :first_name, presence: true, format: { with: /\A[^\p{ascii}]*\z/, message: "is invalid. Input full-width characters" }
         validates :last_name_kana, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: "is invalid. Input full-width katakana characters" }
         validates :first_name_kana, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: "is invalid. Input full-width katakana characters" }
         validates :birth_date, presence: true
         validates :password, presence: true, format: { with: /\A(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z\d]+\z/, message: "is invalid. Include both letters and numbers" }
         validate :password_length

def password_length
  errors.add(:password, 'is too long (maximum is 128 characters)') if password.present? && password.length > 128
end
         #has_many :items

         
end
