require "plist"

module GeoStalker
  class Locator
    class Darwin < Base
      COMMAND = "/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport -s -x"

      def wifi_access_points
        xml = `#{COMMAND}`
        Plist.parse_xml(xml).map do |data|
          {
            macAddress: data["BSSID"],
            signalStrength: data["RSSI"],
            channel: data["CHANNEL"],
          }
        end
      end
    end
  end
end
