cask "callstage" do
  version "1.40"
  sha256 "63092e2cc84b7fefef69a1723fb0b63ee7434adfa7fa13342eb09fed79fee632"

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
