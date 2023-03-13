# frozen_string_literal: true

module SerproService
  module TokenValidate
    def self.included(base)
      base.include(ClassMethods)
    end

    module ClassMethods
      def validate_token(token)
        raise StandardError, 'Token must be unique' if find_model(token).present?
      end
    end
  end
end
