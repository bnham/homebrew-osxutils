class DyldSharedCacheUtil < Formula
  desc "dyld_shared_cache_util introspects the dyld shared cache"
  homepage "https://opensource.apple.com/tarballs/dyld/"
  url "http://opensource.apple.com/tarballs/dyld/dyld-360.22.tar.gz"
  version "360.22"
  sha256 "0830a7941bc05fe06a467db29bfe1b95a5bc7cb30afe88f97ef78bfa95ac7262"

  depends_on :xcode

  def install
    system "xcodebuild", "-sdk", "macosx", "-configuration", "Release", "-target", "dyld_shared_cache_util"
    bin.install "build/Release/dyld_shared_cache_util"
  end

  test do
    "#{bin}/dyld_shared_cache_util -info"
  end
end
