module Inquisitor
  # In Rails 3, attributes can be protected by `attr_accessible` and `attr_protected`
  # In Rails 4, attributes can be protected by using the gem `protected_attributes`
  # In Rails 5, protecting attributes is obsolete (there are `StrongParameters` only)
  def self.can_protect_attributes?
    (ActiveRecord::VERSION::MAJOR == 3) || defined?(ProtectedAttributes)
  end
end

require 'inquisitor/configuration'
require 'inquisitor/base'

ActiveRecord::Base.class_eval do
  def self.anonymize(*fields, **args)
    args[:class] = self
    Inquisitor::Configuration.new(fields, args)

    include Inquisitor::Base
  end
end
