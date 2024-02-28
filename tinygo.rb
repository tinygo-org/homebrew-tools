class Tinygo < Formula
    desc "TinyGo is a Go compiler for small places. Microcontrollers, WebAssembly, and command-line tools. Based on LLVM."
    homepage "https://tinygo.org/"
    version "0.31.1"

    depends_on "binaryen"
  
    on_macos do
        on_arm do
            url "https://github.com/tinygo-org/tinygo/releases/download/v#{version}/tinygo#{version}.darwin-arm64.tar.gz"
            sha256 "11a039c1c670f6c1d948c0cdb108daffb083477370f2bf748e9c9a51dafa4aa9"
        end
        on_intel do
            url "https://github.com/tinygo-org/tinygo/releases/download/v#{version}/tinygo#{version}.darwin-amd64.tar.gz"
            sha256 "af5a4fc2e67b7544cea74857256ac14a2216212f117036c508f8c0e8f6e8c646"
        end
    end
    on_linux do
        url "https://github.com/tinygo-org/tinygo/releases/download/v#{version}/tinygo#{version}.linux-amd64.tar.gz"
        sha256 "5691edd1c6d09f0c62e1bc2c146388643a2bbee1e0540db9538001e7c897c842"
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
  
