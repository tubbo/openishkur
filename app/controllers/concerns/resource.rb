# Macro for adding multiple +expose+ calls.
module Resource
  extend ActiveSupport::Concern

  module ClassMethods
    def resource(name)
      expose name.to_s.singularize.to_sym
      expose name.to_s.pluralize.to_sym
    end
  end
end
