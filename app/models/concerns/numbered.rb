module Numbered
  extend ActiveSupport::Concern

  included do
    before_validation :set_number
  end

  def set_number
    self.number ||= number_scope.count + 1
  end

  def number_scope
    self
  end
end
