class User < ApplicationRecord
  devise :confirmable,
         :database_authenticatable,
         :recoverable,
         :registerable,
         :rememberable,
         :validatable

  PASSWORD_MINIMUM_LENGTH = 30

  validates :bio,      length: { maximum: 300 }
  validates :email,    uniqueness: true, 'valid_email_2/email': true
  validates :username, presence: true, uniqueness: true, length: { in: 2..40 }

  validates :password,
            presence:  true,
            on:        :create,
            length:    { minimum: PASSWORD_MINIMUM_LENGTH },
            exclusion: {
              in:      [
                'mickey fickey fire cracker soap on a rope',
                'a long passphrase to meet the minimum length'
              ],
              message: 'The passphrase ‘%<value>{value}’ is prohibited.'
            }

  def handle
    "@#{username}"
  end

  def path
    "/@#{username}"
  end
end
