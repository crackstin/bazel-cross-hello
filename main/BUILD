load("@rules_cc//cc:defs.bzl", "cc_binary")

platform(
    name = "windows_x86_32",
    constraint_values = [
        "@platforms//cpu:x86_32",
        "@platforms//os:windows",
    ],
)

cc_binary(
    name = "hello-world",
    srcs = ["hello-world.cc"],
    linkopts = ["-lws2_32",],
    deps = [ "@coost", ],
)

cc_binary(
    name = "hello-triangle",
    srcs = ["hello-triangle.cc"],
    copts = [
        "-Ideps",
    ],
    linkopts = select({
        "@platforms//os:windows": [
            "-lws2_32",
            "-lgdi32",
        ],
        "//conditions:default": [],
    }),
    deps = select({
        "@platforms//os:windows": [
            "//deps:glad",
            "@wcoost",
            "@wglfw",
            "@wglm",
        ],
        "//conditions:default": [
            "//deps:glad",
            "@coost",
            "@glfw",
            "@glm",
        ],
    }),
)
