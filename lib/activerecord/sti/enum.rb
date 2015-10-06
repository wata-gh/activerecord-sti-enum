require "activerecord/sti/enum/version"

module ActiveRecord
  module Sti
    module Enum
      def self.included(klass)
        klass.extend ClassMethods
        klass.class_eval do
          def self.inherited(child)
            begin
              self.class_eval do
                add_enum({self.inheritance_column => {child.to_s.underscore.to_sym => child.to_s}})
              end
            ensure
              super
            end
          end
        end
        Dir.glob('./app/models/*.rb').each do |f|
          require File.basename(f)
        end
      end

      module ClassMethods
        def add_enum definitions
          klass = self
          definitions.each do |name, values|
            enum_values = defined_enums[name.to_s] ||= ActiveSupport::HashWithIndifferentAccess.new
            name        = name.to_sym

            klass.singleton_class.send(:define_method, name.to_s.pluralize) { enum_values }

            _enum_methods_module.module_eval do
              pairs = values.respond_to?(:each_pair) ? values.each_pair : values.each_with_index
              pairs.each do |value, i|
                enum_values[value] = i

                define_method("#{value}?") { self[name] == i }
                define_method("#{value}!") { update! name => value }

                klass.scope value, -> { klass.where name => i }
              end
            end
            defined_enums[name.to_s] = enum_values
          end
        end
      end

      private
      def _enum_methods_module
        @_enum_methods_module ||= begin
          mod = Module.new
          include mod
          mod
        end
      end
    end
  end
end
