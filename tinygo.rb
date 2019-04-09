class TinyGo < Formula
    desc "TinyGo is a Go compiler for small places."
    homepage "https://tinygo.org/"
    version "0.4.2.0"
  
    url "https://411-136505169-gh.circle-artifacts.com/0/tmp/tinygo.darwin-amd64.tar.gz"
    sha256 "4c664ff866fad2530122347c05f7ac40a76d22b83d76aa265a80372564737f05"
    
    bottle :unneeded
  
    def install
        bin.install "bin/tinygo"
        lib.install Dir["lib/*"]
        prefix.install "src"
        prefix.install "targets"
    end
  
    test do
        system "#{bin}/tinygo", "version"
    end
  end
  