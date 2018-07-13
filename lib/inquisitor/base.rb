module Inquisitor
  module Base
    def self.included(base)
      base.class_eval do

        def anonymize!
          self.anonymize
          self.anonymized = true
          self.save
        end

        def anonymize
          self.class.instance_methods(false).map(&:to_s).select{|m| m.include?('inquisitor_options_for_') && !m.include?('=')}.each do |inquisitor_method|
            puts inquisitor_method
            field = inquisitor_method.sub('inquisitor_options_for_', '')
            self[field] = get_anonymized_value(self.class.send(inquisitor_method)) unless self[field].blank?
          end
          self
        end

        private

        def get_anonymized_value(options)
          val = ''
          val += (options[:prefix] == true ? 'Anonymous' : options[:prefix]) if options[:prefix].present?
          val += SecureRandom.uuid.gsub('-', '') if options[:unique]
          val += '@example.com' if options[:email]
          val
        end
      end
    end
  end
end
