register_toolchains(
    "//toolchain:cc_toolchain_for_windows_x86_32",
)

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

http_archive(
    name = "io_tweag_rules_nixpkgs",
    sha256 = "2a555348d7f8593fca2bf3fc6ce53c5d62929de81b6c292e23f16c557c0ae45a",
    strip_prefix = "rules_nixpkgs-0.11.1",
    urls = ["https://github.com/tweag/rules_nixpkgs/releases/download/v0.11.1/rules_nixpkgs-0.11.1.tar.gz"],
)

load("@io_tweag_rules_nixpkgs//nixpkgs:repositories.bzl", "rules_nixpkgs_dependencies")

rules_nixpkgs_dependencies()

load(
    "@io_tweag_rules_nixpkgs//nixpkgs:nixpkgs.bzl",
    "nixpkgs_cc_configure",
    "nixpkgs_git_repository",
    "nixpkgs_http_repository",
    "nixpkgs_package",
)

nixpkgs_git_repository(
    name = "nixpkgs",
    remote = "https://github.com/crackstin/nixpkgs.git",
    revision = "4aa4ea7629a65097ed95ba3f0a57518304f4fb6d",
)

nixpkgs_package(
    name = "glfw",
    build_file = "@//toolchain:nix/glfw.BUILD",
    repository = "@nixpkgs",
)

nixpkgs_package(
    name = "glm",
    build_file = "@//toolchain:nix/glm.BUILD",
    repository = "@nixpkgs",
)

nixpkgs_package(
    name = "coost",
    build_file = "@//toolchain:nix/coost.BUILD",
    repository = "@nixpkgs",
)

nixpkgs_http_repository(
    name = "nixcrpkgs",
    strip_prefix = "nixcrpkgs-3c4046f3387bcf930364fd804a4e0deae8187e7e",
    url = "https://github.com/crackstin/nixcrpkgs/archive/3c4046f3387bcf930364fd804a4e0deae8187e7e.tar.gz",
)

nixpkgs_package(
    name = "wcoost",
    attribute_path = "win32.coost",
    build_file = "@//toolchain:win/coost.BUILD",
    nix_file_content = "import <nixcrpkgs> { nixpkgs = import <nixpkgs> {}; }",
    repositories = {
        "nixpkgs": "@nixpkgs",
        "nixcrpkgs": "@nixcrpkgs",
    },
)

nixpkgs_package(
    name = "wglfw",
    attribute_path = "win32.glfw",
    build_file = "@//toolchain:win/glfw.BUILD",
    nix_file_content = "import <nixcrpkgs> { nixpkgs = import <nixpkgs> {}; }",
    repositories = {
        "nixpkgs": "@nixpkgs",
        "nixcrpkgs": "@nixcrpkgs",
    },
)

nixpkgs_package(
    name = "wglm",
    attribute_path = "win32.glm",
    build_file = "@//toolchain:win/glm.BUILD",
    nix_file_content = "import <nixcrpkgs> { nixpkgs = import <nixpkgs> {}; }",
    repositories = {
        "nixpkgs": "@nixpkgs",
        "nixcrpkgs": "@nixcrpkgs",
    },
)

nixpkgs_cc_configure(
    cross_cpu = "x86_32",
    exec_constraints = [
        "@platforms//cpu:x86_64",
        "@platforms//os:linux",
    ],
    nix_file = "@//toolchain:toolchain.nix",
    repositories = {
        "nixpkgs": "@nixpkgs",
        "nixcrpkgs": "@nixcrpkgs",
    },
    target_constraints = [
        "@platforms//cpu:x86_32",
        "@platforms//os:windows",
    ],
)
