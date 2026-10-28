class Tinygo < Formula
    desc "TinyGo is a Go compiler for small places. Microcontrollers, WebAssembly, and command-line tools. Based on LLVM."
    homepage "https://tinygo.org/"
    version "0.44.0"

    depends_on "binaryen"
  
    on_macos do
        on_arm do
            url "https://github.com/tinygo-org/tinygo/releases/download/v#{version}/tinygo#{version}.darwin-arm64.tar.gz"
            sha256 "696a37db149c2c37ed0da96cc1f2cca2630fca0c4dd19823a2a481c9b4a6a748"
        end
        on_intel do
            url "https://github.com/tinygo-org/tinygo/releases/download/v#{version}/tinygo#{version}.darwin-amd64.tar.gz"
            sha256 "405b8241e20825cd3e7267706eb27c4f40fe372f3548a4d7f80ef2eb640957a7"
        end
    end
    on_linux do
        url "https://github.com/tinygo-org/tinygo/releases/download/v#{version}/tinygo#{version}.linux-amd64.tar.gz"
        sha256 "ed0f45543a49ff2a99120a5a1b8814a0750e1fda1a66f8e2a0a172576134aaf9"
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
  
