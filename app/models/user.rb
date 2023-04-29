class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :nickname, presence: true
         validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "is invalid. Input full-width characters" }
         validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "is invalid. Input full-width characters" }
         validates :last_name_kana, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: "is invalid. Input full-width katakana characters" }
         validates :first_name_kana, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: "is invalid. Input full-width katakana characters" }
         validates :birth_date, presence: true
         validates :password, presence: true, format: { with: /\A(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z\d]+\z/, message: "is invalid. Include both letters and numbers" }
         validates :email, presence: true, format: { with: /\A\S+@\S+\.\S+\z/, message: "is invalid. Input a valid email address" }
         validate :password_length
         validate :password_not_only_digits
         validate :password_not_contain_full_width_characters
         validate :password_not_only_alphabets

def password_length
  errors.add(:password, 'is too long (maximum is 128 characters)') if password.present? && password.length > 128
end

def password_not_only_digits
  errors.add(:password, 'is invalid. Input both letters and numbers') if password.present? && password.match(/\A\d+\z/)
end

def password_not_contain_full_width_characters
  errors.add(:password, 'is invalid. Input half-width characters') if password.present? && password.match(/[^\x01-\x7E]/)
end

def password_not_only_alphabets
  errors.add(:password, 'is invalid. Input both letters and numbers') if password.present? && password.match(/\A[a-zA-Z]+\z/)
end

         #has_many :items        
end
