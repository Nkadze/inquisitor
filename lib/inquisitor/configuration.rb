module Inquisitor
  class Configuration
    def initialize(*fields, **args)
      raise ArgumentError unless fields
      raise ArgumentError unless args
      klass = args[:class]
      puts fields
      fields.each do |f|
        puts f.class
        puts f
        puts "inquisitor_options_for_#{f}"
        klass.class_attribute :"inquisitor_options_for_#{f}", instance_predicate: false
        klass.send("inquisitor_options_for_#{f}=".to_sym, args)
      end
    end
  end
end
