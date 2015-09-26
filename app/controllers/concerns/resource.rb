# Macro for adding multiple +expose+ calls.
module Resource
  extend ActiveSupport::Concern

  module ClassMethods
    def resource(name, options = {})
      expose name.to_s.singularize.to_sym, options.merge(except: [:index])
      expose name.to_s.pluralize.to_sym, options.merge(only: [:index])
    end
  end
end
