class Tinygo < Formula
    desc "TinyGo is a Go compiler for small places. Microcontrollers, WebAssembly, and command-line tools. Based on LLVM."
    homepage "https://tinygo.org/"
    version "0.22.0"

    depends_on "binaryen"
  
    if OS.mac?
        url "https://github.com/tinygo-org/tinygo/releases/download/v#{version}/tinygo#{version}.darwin-amd64.tar.gz"
        sha256 "880ac47a1740c1e28a95e3cdc6fba44f6f5e7a3157e664ecb337d1e98b5e05e0"
    elsif OS.linux?
        url "https://github.com/tinygo-org/tinygo/releases/download/v#{version}/tinygo#{version}.linux-amd64.tar.gz"
        sha256 "c69039d7a1db27b49c391511d766747983795f5cd2eedbe4483bcda4c8d98809"
    end

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
  
