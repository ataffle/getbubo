class PagePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end

    def team?
      true
    end
  end
end
