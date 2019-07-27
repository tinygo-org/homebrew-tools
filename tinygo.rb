class Tinygo < Formula
    desc "TinyGo is a Go compiler for small places. Microcontrollers, WebAssembly, and command-line tools. Based on LLVM."
    homepage "https://tinygo.org/"
    version "0.7.1"
  
    url "https://github.com/tinygo-org/tinygo/releases/download/v0.7.1/tinygo0.7.1.darwin-amd64.tar.gz"
    sha256 "30caa68daf25316a241eb6dd8801529d01868248fd1e11d38f1f7276c652ad56"
    
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
  
