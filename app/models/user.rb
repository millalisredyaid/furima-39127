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
         #validates :email, presence: true, format: { with: /\A\S+@\S+\.\S+\z/, message: "is invalid. Input a valid email address" }
         validates :password, length: { maximum: 128 },
                     format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: "is invalid. Input both letters and numbers" },
                     exclusion: { in: ->(_){ %w[00000000 11111111 22222222 33333333 44444444 55555555 66666666 77777777 88888888 99999999 000000000 111111111 222222222 333333333 444444444 555555555 666666666 777777777 888888888 999999999] },
                                  message: "" },
                     allow_blank: true
validate :password_not_contain_full_width_characters

def password_not_contain_full_width_characters
  errors.add(:password, "is invalid. Input full-width characters") if password.present? && password.match?(/[^\x01-\x7E]/)
end

         has_many :items
         has_many :orders      
end

