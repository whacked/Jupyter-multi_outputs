{ pkgs ? import <nixpkgs> {} }:
pkgs.mkShell {
  buildInputs = [
    pkgs.nodejs
  ];

  shellHook = ''
    function install-extension() {
      if [ "x$VIRTUAL_ENV" == "x" ]; then
        echo "no virtualenv detected, not autorunning."
        type install-extension
        return
      fi
      $VIRTUAL_ENV/bin/python setup.py install
      jupyter nbextension install --py lc_multi_outputs --user
      jupyter nbextension enable --py lc_multi_outputs --user
    }
  '';
}
