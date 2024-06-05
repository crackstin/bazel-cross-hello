# NEW
load("@bazel_tools//tools/build_defs/cc:action_names.bzl", "ACTION_NAMES")
# NEW
load(
    "@bazel_tools//tools/cpp:cc_toolchain_config_lib.bzl",
    "feature",    # NEW
    "flag_group", # NEW
    "flag_set",   # NEW
    "tool_path",
    "artifact_name_pattern",
)

all_link_actions = [ # NEW
    ACTION_NAMES.cpp_link_executable,
    ACTION_NAMES.cpp_link_dynamic_library,
    ACTION_NAMES.cpp_link_nodeps_dynamic_library,
]


def _impl(ctx):
    tool_paths = [
        tool_path(
            name = "gcc",
            path = "/nix/store/vk8cvvlmw06f3zlk8dn534kms0g7vwmx-gcc-12.2.0-i686-w64-mingw32/bin/i686-w64-mingw32-gcc",
        ),
        tool_path(
            name = "ld",
            path = "/nix/store/ilywns100wd02ls23bv2l8kw6il35bhl-binutils-2.40-i686-w64-mingw32/bin/i686-w64-mingw32-ld",
        ),
        tool_path(
            name = "ar",
            path = "/usr/bin/ar",
        ),
        tool_path(
            name = "cpp",
            path = "/bin/false",
        ),
        tool_path(
            name = "gcov",
            path = "/bin/false",
        ),
        tool_path(
            name = "nm",
            path = "/bin/false",
        ),
        tool_path(
            name = "objdump",
            path = "/bin/false",
        ),
        tool_path(
            name = "strip",
            path = "/bin/false",
        ),
    ]

    features = [ # NEW
        feature(
            name = "default_linker_flags",
            enabled = True,
            flag_sets = [
                flag_set(
                    actions = all_link_actions,
                    flag_groups = ([
                        flag_group(
                            flags = [
                                "-lstdc++",
                            ],
                        ),
                    ]),
                ),
            ],
        ),
    ]
    return cc_common.create_cc_toolchain_config_info(
        ctx = ctx,
	artifact_name_patterns = [
artifact_name_pattern(
    category_name = "executable",
    prefix = "",
    extension = ".exe",
),],
        features = features,
        cxx_builtin_include_directories = [ # NEW
        "/nix/store/vk8cvvlmw06f3zlk8dn534kms0g7vwmx-gcc-12.2.0-i686-w64-mingw32/i686-w64-mingw32/include",
        "/nix/store/mpnmsyp1g2iffkkb05xfm10wilp8dr95-mingw-w64-v10.0.0-i686-w64-mingw32/include",
        "/nix/store/vk8cvvlmw06f3zlk8dn534kms0g7vwmx-gcc-12.2.0-i686-w64-mingw32/lib/gcc/i686-w64-mingw32/12.2.0/include-fixed",
        "/nix/store/vk8cvvlmw06f3zlk8dn534kms0g7vwmx-gcc-12.2.0-i686-w64-mingw32/lib/gcc/i686-w64-mingw32/12.2.0/include",
    ],
        toolchain_identifier = "x86_32-toolchain",
        host_system_name = "local",
        target_system_name = "windows_target",
        target_cpu = "x86_64",
        target_libc = "unknown",
        compiler = "clang",
        abi_version = "unknown",
        abi_libc_version = "unknown",
        tool_paths = tool_paths,
    )

cc_toolchain_config = rule(
    implementation = _impl,
    attrs = {},
    provides = [CcToolchainConfigInfo],
)
