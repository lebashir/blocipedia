class WikiPolicy < ApplicationPolicy
  class Scope
    attr_reader :user, :scope

    def resolve
      scope
    end
  end
end
