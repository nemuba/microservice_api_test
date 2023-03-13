# frozen_string_literal: true

module SerproService
  module Creator
    def self.included(base)
      base.include(ClassMethods)
    end

    module ClassMethods
      def create_model(params)
        Serpro.create!(params)
      end

      def run_process(model)
        SerproJob.perform_async(model.token)
      end
    end
  end
end
