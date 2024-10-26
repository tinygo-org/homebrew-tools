class Tinygo < Formula
    desc "TinyGo is a Go compiler for small places. Microcontrollers, WebAssembly, and command-line tools. Based on LLVM."
    homepage "https://tinygo.org/"
    version "0.34.0"

    depends_on "binaryen"
  
    on_macos do
        on_arm do
            url "https://github.com/tinygo-org/tinygo/releases/download/v#{version}/tinygo#{version}.darwin-arm64.tar.gz"
            sha256 "6a9bae4e57aaf8bf814cd62df6d527d402394eca59257b2bb1dddd3bcb3a51a7"
        end
        on_intel do
            url "https://github.com/tinygo-org/tinygo/releases/download/v#{version}/tinygo#{version}.darwin-amd64.tar.gz"
            sha256 "451c51a080b3b64d1ac99906840478f712ac62bbf7e1e9bc55ddd04e3730455e"
        end
    end
    on_linux do
        url "https://github.com/tinygo-org/tinygo/releases/download/v#{version}/tinygo#{version}.linux-amd64.tar.gz"
        sha256 "8acd27a39090e1e5c3ca341e81350f813ec6a02bf8090c4fc7c4b1afd4186341"
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
  
