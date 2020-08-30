module Paginator
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def page(num)
      where(page: num)
    end
  end
end
