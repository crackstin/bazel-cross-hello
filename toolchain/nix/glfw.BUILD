load("@rules_cc//cc:defs.bzl", "cc_library")
filegroup(
    name = "include",
    srcs = glob(["include/**/*.h"]),
    visibility = ["//visibility:public"],
)
filegroup(
    name = "lib",
    srcs = glob(["lib/**/*.so*", "lib/**/*.dylib", "lib/**/*.a"], allow_empty = True),
    visibility = ["//visibility:public"],
)

cc_library(
    name = "glfw",
    hdrs = [":include"],
    srcs = [ ":lib" ],
    strip_include_prefix = "include",
    visibility = ["//visibility:public"],
)
