module DavePaginator

  def self.included(base)

    base.class_eval do

      scope :paged, -> (page, per_page) { limit(per_page.to_i).offset((page.to_i - 1) * per_page.to_i)}

      include InstanceMethods
      extend ClassMethods
    end
  end

  module InstanceMethods

  end

  module ClassMethods
    
  end
end