module Inquisitor
  class Configuration
    def initialize(*fields, **args)      
      klass = args[:class]
      args.except!(:class)
      raise ArgumentError unless fields
      raise ArgumentError unless args
      fields.flatten.each do |f|
        klass.class_attribute :"inquisitor_options_for_#{f}", instance_predicate: false
        klass.send("inquisitor_options_for_#{f}=".to_sym, args)
      end
    end
  end
end
