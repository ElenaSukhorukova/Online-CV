class UserPolicy < ApplicationPolicy
  def show?
    user.admin_role?
  end
end
