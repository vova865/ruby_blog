class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  def formatted_created_at
    created_at.strftime('%Y-%m-%d %H:%M:%S') #?
  end
end
