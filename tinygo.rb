class Tinygo < Formula
    desc "TinyGo is a Go compiler for small places. Microcontrollers, WebAssembly, and command-line tools. Based on LLVM."
    homepage "https://tinygo.org/"
    version "0.5.0"
  
    url "https://github.com/tinygo-org/tinygo/releases/download/v0.5.0/tinygo0.5.0.darwin-amd64.tar.gz"
    sha256 "b4385e633726e715d036700078cc874015eeb9f4f458b16f41fd1acc2f74c0c4"
    
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
  