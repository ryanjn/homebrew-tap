cask "callstage-location" do
  version "1.0"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"

  url "https://updates.callstage.app/tools/callstage-location-#{version}.zip"
  name "Callstage Location"
  desc "Prints the current city for a Callstage text layer"
  homepage "https://github.com/ryanjn/homebrew-tap"

  depends_on macos: :ventura

  binary "location", target: "callstage-location"
  artifact "CallstageLocate.app",
           target: "#{Dir.home}/Library/Application Support/Callstage/CallstageLocate.app"

  zap trash: "~/Library/Application Support/Callstage"

  caveats <<~EOS
    In Callstage, add a Text layer and set its command to:
      callstage-location

    It prints "City, ST" (or "City, Country"). The first run asks for
    Location access for "Callstage Location"; without it, it falls back to
    IP geolocation, which shows a VPN's city when one is on.
  EOS
end
