class Tinygo < Formula
    desc "TinyGo is a Go compiler for small places. Microcontrollers, WebAssembly, and command-line tools. Based on LLVM."
    homepage "https://tinygo.org/"
    version "0.6.0"
  
    url "https://github.com/tinygo-org/tinygo/releases/download/v0.6.0/tinygo0.6.0.darwin-amd64.tar.gz"
    sha256 "bbacc833f52637c75cf418df438ff015eb9587d1e940f934b9b2c07a8b92e79d"
    
    bottle :unneeded
  
    def install
        libexec.install "bin/tinygo"
        (bin/"tinygo").write_env_script libexec/"tinygo",
            :TINYGOROOT => prefix
        lib.install Dir["lib/*"]
        prefix.install "src"
        prefix.install "targets"
    end
  
    test do
        system "#{bin}/tinygo", "version"
    end
  end
  