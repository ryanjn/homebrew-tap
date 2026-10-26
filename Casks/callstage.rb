cask "callstage" do
  version "1.38"
  sha256 "ab64179d79f9788d2adccf5ef2eeb7f16d15280d87287da6137e0f0d266f3eb4"

  url "https://updates.callstage.app/releases/Callstage-#{version}.dmg"
  name "Callstage"
  desc "Virtual camera with image, text and video overlays"
  homepage "https://callstage.app/"

  livecheck do
    url "https://updates.callstage.app/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on macos: :ventura

  app "Callstage.app"

  uninstall quit: "com.tanegeloparksoftware.teevee"

  zap trash: [
    "~/Library/Application Support/Callstage",
    "~/Library/Caches/com.tanegeloparksoftware.teevee",
    "~/Library/Containers/com.tanegeloparksoftware.teevee",
    "~/Library/Group Containers/N6G74L87B9.com.tanegeloparksoftware.teevee.shared",
    "~/Library/HTTPStorages/com.tanegeloparksoftware.teevee",
    "~/Library/Preferences/com.tanegeloparksoftware.teevee.plist",
  ]

  caveats <<~EOS
    Open Callstage once and allow its camera extension in
    System Settings > Privacy & Security. "Callstage Camera" then appears
    in Zoom, Meet, Teams and other video apps.

    Upgrading over an older version can need a restart before the camera
    comes back. Callstage tells you when.
  EOS
end
