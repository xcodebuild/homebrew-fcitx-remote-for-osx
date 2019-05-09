class FcitxRemoteForOsx < Formula
  desc "handle input method in command-line"
  homepage "https://github.com/CodeFalling/fcitx-remote-for-osx"
  url "https://github.com/CodeFalling/fcitx-remote-for-osx/archive/0.3.0.tar.gz"
  sha256 "b4490a6a0db3c28ce3ddbe89dd038f5ab404744539adc5520eab1a1a39819de6"
  
  
  option "with-input-method=",
	  "Select input method: general(default), baidu-pinyin, baidu-wubi, " \
	  "sogou-pinyin, qq-wubi, squirrel-rime, squirrel-rime-upstream, osx-pinyin"

  def install
    input_method = ARGV.value("with-input-method") || "general"
	  system "./build.py", "build", input_method
    bin.install "fcitx-remote-#{input_method}"
	  bin.install_symlink "fcitx-remote-#{input_method}" => "fcitx-remote"
  end

  test do
    system "#{bin}/fcitx-remote"
  end
end
