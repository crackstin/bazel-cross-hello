let
    nixcrpkgs = import <nixcrpkgs> { nixpkgs = import <nixpkgs> {}; };
    nixpkgs = nixcrpkgs.nixpkgs;
in
    nixpkgs.buildEnv {
            name = "bazel-nixcrpkgs-cc";
            paths = [ nixcrpkgs.win32.gcc nixcrpkgs.win32.binutils ];
            pathsToLink = [ "/bin" ];
            postBuild = "echo $out";
            passthru = {
                targetPrefix = "i686-w64-mingw32-";
                isClang = false;
        };
    }
