module GeoStalker
  class Locator
    class Linux < Base
      COMMAND = "iwlist wlan0 scan"

      def wifi_access_points
        lines = `#{COMMAND}`.split(/[\r\n]/)
        lines.map do |line|
          {
            macAddress: line.split(/\s+/).last,
            signalStrength: line.scan(/Signal level[:=](\-?\d+)/)[0][0].to_i,
          }
        end
      end
    end
  end
end
