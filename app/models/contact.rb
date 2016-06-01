class Contact < ActiveRecord::Base

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: { if: :email_changed? }

  def full_name
    full_name = "#{first_name} #{last_name}"
  end

  def friendly_time
    updated_at.strftime("%m/%d/%Y")
  end
end
