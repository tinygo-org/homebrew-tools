class Tinygo < Formula
    desc "TinyGo is a Go compiler for small places. Microcontrollers, WebAssembly, and command-line tools. Based on LLVM."
    homepage "https://tinygo.org/"
    version "0.40.0"

    depends_on "binaryen"
  
    on_macos do
        on_arm do
            url "https://github.com/tinygo-org/tinygo/releases/download/v#{version}/tinygo#{version}.darwin-arm64.tar.gz"
            sha256 "c1df49eaee39c41b3bcb13f46a2e6824ee2c9d8cd0aa000dd2393ea92ace5806"
        end
        on_intel do
            url "https://github.com/tinygo-org/tinygo/releases/download/v#{version}/tinygo#{version}.darwin-amd64.tar.gz"
            sha256 "2c43f77ec6fe8e68007856c98763233c22a02e0bc558d4197cf378353c34b7b7"
        end
    end
    on_linux do
        url "https://github.com/tinygo-org/tinygo/releases/download/v#{version}/tinygo#{version}.linux-amd64.tar.gz"
        sha256 "e56af1baabbf09b8b2c6320b76db57b0a9709405ea404fd9d770de8b9aa4c700"
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
  
