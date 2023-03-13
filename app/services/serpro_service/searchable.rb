# frozen_string_literal: true

module SerproService
  module Searchable
    def self.included(base)
      base.include(ClassMethods)
    end

    module ClassMethods
      def find_model(token)
        Serpro.find_by(token: token)
      end
    end
  end
end
