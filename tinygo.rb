class Tinygo < Formula
    desc "TinyGo is a Go compiler for small places. Microcontrollers, WebAssembly, and command-line tools. Based on LLVM."
    homepage "https://tinygo.org/"
    version "0.26.0"

    depends_on "binaryen"
  
    if OS.mac?
        url "https://github.com/tinygo-org/tinygo/releases/download/v#{version}/tinygo#{version}.darwin-amd64.tar.gz"
        sha256 "1fcef807fd60dd93346c4bb94aa41b3f174b3fac223d692d148289a6fa70adc5"
    elsif OS.linux?
        url "https://github.com/tinygo-org/tinygo/releases/download/v#{version}/tinygo#{version}.linux-amd64.tar.gz"
        sha256 "e7264b6f9b71d4caeee0c2f374c454e90e7b620aff6ab6fd5a938fb9d296b287"
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
  
