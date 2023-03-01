class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

    def create?
      true
    end

    def validate?
      record.plane.user == user && record.status == 'pending'
    end

    def deny?
      record.plane.user == user && record.status == 'pending'
    end

    def update?
      record.user == user
    end

    def destroy?
      record.user == user
    end
end
