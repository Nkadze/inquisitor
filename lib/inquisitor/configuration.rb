module Inquisitor
  class Configuration
    def initialize(*fields, **args)
      raise ArgumentError unless fields
      raise ArgumentError unless args
      klass = self
      fields.each do |field|
        klass.class_attribute :"inquisitor_options_for_#{field}", instance_predicate: false
        klass.send("inquisitor_options_for_#{field}=".to_sym, args)
      end
    end
  end
end