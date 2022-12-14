class PersonalDetailDecorator < ApplicationDecorator
  delegate_all

  def capitalize_full_name
    full_name.split(' ').map(&:capitalize).join(' ')
  end
end
