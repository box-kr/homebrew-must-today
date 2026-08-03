cask "must-today" do
  version "0.1.0"
  sha256 "cb193f76907f87d55a353840bb807663fd4b3a1778372a05d46a06c00be82e1d"

  url "https://github.com/box-kr/must-today/releases/download/v#{version}/MustToday-#{version}.zip"
  name "MustToday"
  desc "Menu bar todo app that shows counts and flags overdue items in red"
  homepage "https://github.com/box-kr/must-today"

  depends_on macos: ">= :sonoma"

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
