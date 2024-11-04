module BetterEnum
  module Extension
    def _enum(name=nil, values=nil, **options)
      super
      singleton_class.send(:define_method, :"#{name}_label") do |key|
        I18n.t(key, default: key.to_s.humanize, scope: [:activerecord, :enums, self.name.underscore.to_sym, name])
      end
      singleton_class.send(:define_method, :"#{name}_value") { |key| defined_enums[name.to_s][key] }
      singleton_class.send(:define_method, :"#{name}_labels") do
        defined_enums[name.to_s].each_with_object({}) { |(key, value), labels| labels[key] = send(:"#{name}_label", key) }.with_indifferent_access
      end
      _enum_methods_module.module_eval do
        klass_scope = klass.name.underscore.to_sym
        enum_values = klass.defined_enums[name.to_s]
        define_method(:"#{name}_label") do
          send(name) && I18n.t((key = send(name).to_sym), default: key.to_s.humanize, scope: [:activerecord, :enums, klass_scope, name])
        end
        define_method(:"#{name}_value") { send(name) && enum_values[send(name)] }
      end
    end
  end
end
