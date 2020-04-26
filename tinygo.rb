class Tinygo < Formula
    desc "TinyGo is a Go compiler for small places. Microcontrollers, WebAssembly, and command-line tools. Based on LLVM."
    homepage "https://tinygo.org/"
    version "0.13.1"
  
    if OS.mac?
        url "https://github.com/tinygo-org/tinygo/releases/download/v#{version}/tinygo#{version}.darwin-amd64.tar.gz"
        sha256 "cd64ddcfe71a6607a47fb7ec457ac29819bffb2da05ba1d2ffd617e3f1bb1bf7"
    elsif OS.linux?
        url "https://github.com/tinygo-org/tinygo/releases/download/v#{version}/tinygo#{version}.linux-amd64.tar.gz"
        sha256 "a7ea6827faa70248bc5efdc8ed7f368d2ca4afed31aca974cf4fede9a3bedefc"
    end
    
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
  
