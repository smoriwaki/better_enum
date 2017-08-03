module BetterEnum
  module Extension
    def enum(definitions)
      super
      klass = self
      definitions.each do |name, values|
        enum_values = send(name.to_s.pluralize)
        singleton_class.send(:define_method, :"#{name}_label") do |key|
          I18n.t(key, default: key.to_s.humanize, scope: [:activerecord, :enums, self.name.underscore.to_sym, name])
        end
        singleton_class.send(:define_method, :"#{name}_value") { |key| enum_values[key] }
        singleton_class.send(:define_method, :"#{name}_labels") do
          enum_values.each_with_object({}) { |(key, value), labels| labels[key] = send(:"#{name}_label", key) }.with_indifferent_access
        end
        _enum_methods_module.module_eval do
          define_method(:"#{name}_label") { I18n.t((key = send(name).to_sym), default: key.to_s.humanize, scope: [:activerecord, :enums, klass.name.underscore.to_sym, name]) }
          define_method(:"#{name}_value") { enum_values[send(name)] }
        end
      end
    end
  end
end
