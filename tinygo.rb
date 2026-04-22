class Tinygo < Formula
    desc "TinyGo is a Go compiler for small places. Microcontrollers, WebAssembly, and command-line tools. Based on LLVM."
    homepage "https://tinygo.org/"
    version "0.41.1"

    depends_on "binaryen"
  
    on_macos do
        on_arm do
            url "https://github.com/tinygo-org/tinygo/releases/download/v#{version}/tinygo#{version}.darwin-arm64.tar.gz"
            sha256 "c684d154d89a452cc9c7fc5dc5fc80cb6a42445b3e44b3c12ed048692de0f341"
        end
        on_intel do
            url "https://github.com/tinygo-org/tinygo/releases/download/v#{version}/tinygo#{version}.darwin-amd64.tar.gz"
            sha256 "1a8e62a234d3aea20793ada2c4a628de96ed7533384f0f5dc3c3f2ffa84f9bab"
        end
    end
    on_linux do
        url "https://github.com/tinygo-org/tinygo/releases/download/v#{version}/tinygo#{version}.linux-amd64.tar.gz"
        sha256 "e156d1d93a376eef639a4143d13be07e8c463fb6cf2d7d447698ed4474d23e91"
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
  
