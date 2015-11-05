class FcitxRemoteForOsx < Formula
  desc "handle input method in command-line"
  homepage "https://github.com/CodeFalling/fcitx-remote-for-osx"
  url "https://github.com/CodeFalling/fcitx-remote-for-osx/archive/0.0.2.tar.gz"
  sha256 "746505694090d98d5ad572758e7597c49d3bea1b00208a8272c3648aad15ad69"

  INPUT_METHOD = %w[baidu-pinyin baidu-wubi sogou-pinyin qq-wubi squirrel-rime osx-pinyin]
  INPUT_METHOD.each do |im|
    option "with-#{im}", "Build fcitx-remote for osx with #{im} support"
  end

  def install
    input_method = nil
    INPUT_METHOD.each do |im|
      if build.with? im
        input_method = im
      end
    end

    unless input_method
      input_method = "baidu-pinyin"
    end
    system "./build.py", "build", input_method
    bin.install Dir["fcitx-remote-#{input_method}"]
    bin.install_symlink "fcitx-remote-#{input_method}" => "fcitx-remote"
  end

  test do
    system "#{bin}/fcitx-remote"
  end
end
