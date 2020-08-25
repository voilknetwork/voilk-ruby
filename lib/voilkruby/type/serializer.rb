module VoilkRuby
  module Type
    class Serializer
      include VoilkRuby::Utils
      
      def initialize(key, value)
        @key = key
        @value = value
      end
    end
  end
end
