module Mongoid
  module MapReduce
    module Serialization

      # Serialize an object to the specified class
      #
      # obj - Object to serialize
      # klass - Class to prefer
      #
      # Returns serialized object or nil
      def serialize(obj, klass)
        return nil if obj.blank?
        obj = obj.is_a?(Boolean) ? (obj ? 1 : 0) : obj

        obj = obj.to_s =~ /(^[-+]?[0-9]+$)|(\.0+)$/ ? obj.to_i : obj.to_f
        obj.to_json
=begin

        # Mongoid::Fields::Mappings removed in mongoid 3.*
        Mongoid::Fields::Mappings.for(klass).allocate.serialize(obj)
=end
      end

    end
  end
end
