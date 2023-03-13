# frozen_string_literal: true

class ApplicationService
  def self.call(*args, &block)
    new(*args, &block).call
  end

  def self.show(*args, &block)
    new(*args, &block).show
  end
end
