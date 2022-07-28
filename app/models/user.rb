class User < ApplicationRecord
  devise :confirmable,
         :database_authenticatable,
         :recoverable,
         :registerable,
         :rememberable,
         :validatable

  PASSWORD_MINIMUM_LENGTH = 30

  validate :birthday_can_only_change_once, if: -> { birthday_changed? }
  validate :age_is_over_thirteen,          if: -> { birthday_changed? }

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

  def age
    return if birthday.blank?

    ((Time.zone.now - birthday.to_time) / 1.year.seconds).floor
  end

  private

  def birthday_can_only_change_once
    if previous_birthday.present?
      binding.irb
      errors.add(:birthday, 'can’t be changed more than once')
    else
      self.previous_birthday = birthday_was
    end
  end

  def age_is_over_thirteen
    return unless birthday.present? && birthday > 13.years.ago

    errors.add(:birthday, 'is too recent. You must be at least 13 years old to use this site')
  end
end
