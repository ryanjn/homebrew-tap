cask "callstage-location" do
  version "1.1.1"
  sha256 "af53d194c3f0ae221b7abeb28ab2d3899f90723d169acf91ab271130daeb882e"

  url "https://updates.callstage.app/tools/callstage-location-#{version}.zip"
  name "Callstage Location"
  desc "Prints the current city, address or metro area for a Callstage text layer"
  homepage "https://github.com/ryanjn/homebrew-tap"

  livecheck do
    skip "Published by the Callstage release scripts, which bump this cask"
  end

  depends_on macos: :ventura

  binary "location"
  artifact "CallstageLocate.app",
           target: "#{Dir.home}/Library/Application Support/Callstage/CallstageLocate.app"

  zap trash: "~/Library/Application Support/Callstage"

  caveats <<~EOS
    In Callstage, add a Text layer and set its command to, for example:
      location            # Portland, OR
      location metro      # Portland-Vancouver-Hillsboro, OR-WA
      location -f '{city}, {state}'
    `location --help` lists every preset and template token.

    The first run asks for Location access for "Callstage Location". Without
    it, location falls back to IP geolocation: city-level only, and a VPN's
    city when one is on.

    Metro data: US Census Bureau (public domain) and GeoNames (CC BY 4.0).
  EOS
end
