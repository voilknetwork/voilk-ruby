module VoilkRuby
  module Type
  
    # See: https://github.com/xeroc/python-graphenelib/blob/98de98e219264d45fe04b3c28f3aabd1a9f58b71/graphenebase/types.py
    class PointInTime < Serializer
      def initialize(value)
        super(:point_in_time, value)
      end
      
      def to_bytes
        [Time.parse(@value + 'Z').to_i].pack('I')
      end
      
      def to_s
        @value
      end
    end
  end
end
