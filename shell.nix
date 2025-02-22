{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    ruby_3_2
    bundler
  ];

  shellHook = ''
    # Install the specific bundler version needed
    if ! gem list bundler -i -v 2.6.2; then
      echo "Installing Bundler 2.6.2..."
      gem install bundler -v 2.6.2
    fi

    # Use the specific bundler version
    export BUNDLER_VERSION=2.6.2

    echo "Ruby development environment loaded"
    echo "Ruby version: $(ruby --version)"
    echo "Bundler version: $(bundler --version)"
    bundle install
  '';
} 