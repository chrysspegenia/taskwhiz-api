class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  private

  def capitalize_title
    self.title = title.camelcase
  end
end
