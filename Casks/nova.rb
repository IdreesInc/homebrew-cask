cask "nova" do
  version "10.3"
  sha256 "5abf5f5c872f060a13b565a9208c5ef0eb545455a29872763ba0b295156207b9"

  url "https://download-keycdn.panic.com/nova/Nova%20#{version}.zip",
      verified: "download-keycdn.panic.com/nova/"
  name "Panic Nova"
  desc "Native code editor"
  homepage "https://nova.app/"

  livecheck do
    url "https://circle.panic.com/api/v1/appcast/nova/"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on macos: ">= :big_sur"

  app "Nova.app"
  binary "#{appdir}/Nova.app/Contents/SharedSupport/nova"
  artifact "#{appdir}/Nova.app/Contents/Resources/nova_completions.txt",
           target: "#{HOMEBREW_PREFIX}/share/zsh/site-functions/_nova"

  uninstall delete: [
    "/Library/LaunchDaemons/com.panic.NovaPrivilegedHelper.plist",
    "/Library/PrivilegedHelperTools/com.panic.NovaPrivilegedHelper",
    "#{HOMEBREW_PREFIX}/share/zsh/site-functions/_nova",
  ]

  zap trash: [
    "~/Library/Application Scripts/com.panic.Nova.NovaQuickLookPreview",
    "~/Library/Application Scripts/com.panic.Nova.NovaQuickLookThumbnail",
    "~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/com.panic.nova.sfl*",
    "~/Library/Caches/com.panic.Nova",
    "~/Library/Containers/com.panic.Nova.NovaQuickLookPreview",
    "~/Library/Containers/com.panic.Nova.NovaQuickLookThumbnail",
    "~/Library/Preferences/com.panic.Nova.plist",
    "~/Library/WebKit/com.panic.Nova",
  ]
end
