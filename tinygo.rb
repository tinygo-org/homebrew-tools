class Tinygo < Formula
    desc "TinyGo is a Go compiler for small places. Microcontrollers, WebAssembly, and command-line tools. Based on LLVM."
    homepage "https://tinygo.org/"
    version "0.7.0"
  
    url "https://github.com/tinygo-org/tinygo/releases/download/v0.7.0/tinygo0.7.0.darwin-amd64.tar.gz"
    sha256 "f6670a6e456514929769236948443af22cf8cf8cf002e2e5e5dc38dfba7f6962"
    
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
  
