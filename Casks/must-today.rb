cask "must-today" do
  version "0.2.0"
  sha256 "7a332a67ef28ac22bbf743873a25d9287a912990b3a32b79d807785c689040ab"

  url "https://github.com/box-kr/must-today/releases/download/v#{version}/MustToday-#{version}.zip"
  name "MustToday"
  desc "Menu bar todo app that shows counts and flags overdue items in red"
  homepage "https://github.com/box-kr/must-today"

  # 최소 macOS 버전은 앱 번들의 LSMinimumSystemVersion(14.0)으로 강제됩니다.
  # (일부 Homebrew 버전이 depends_on macos 문법을 거부해 Cask 에서는 생략)

  app "MustToday.app"

  # ad-hoc 서명(비공증) 앱이므로 다운로드 후 Gatekeeper 격리 속성을 제거합니다.
  postflight do
    system_command "xattr",
                   args: ["-cr", "#{appdir}/MustToday.app"],
                   sudo: false,
                   must_succeed: false
  end

  zap trash: [
    "~/Library/Application Support/MustToday",
    "~/Library/Preferences/kr.box.macos.must_today.plist",
  ]
end
