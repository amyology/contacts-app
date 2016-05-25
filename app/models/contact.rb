class Contact < ActiveRecord::Base
  def full_name
    full_name = "#{first_name} #{last_name}"
  end

  def friendly_time
    updated_at.strftime("%m/%d/%Y")
  end
end
