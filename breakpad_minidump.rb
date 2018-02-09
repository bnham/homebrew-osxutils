class BreakpadMinidump < Formula
  desc "breakpad_minidump is a set of tools that can be used to inspect Google Breakpad minidumps"
  homepage "https://chromium.googlesource.com/breakpad/breakpad/"
  head "https://chromium.googlesource.com/breakpad/breakpad.git", :branch => "chrome_64"
  version "chrome_64"

  depends_on :xcode

  def install
    system "./configure", "--prefix=#{prefix}"
    system "make"

    # Install manually since we only want to install the binaries to
    # #{prefix}/bin. We don't want the headers or libraries installed.
    bin.install "src/processor/minidump_dump"
    bin.install "src/processor/minidump_stackwalk"
    bin.install "src/processor/microdump_stackwalk"
  end

  test do
    system "#{bin}/minidump_dump", "-h"
  end
end
