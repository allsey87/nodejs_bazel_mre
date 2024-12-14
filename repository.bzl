def _test_repository_impl(ctx):
    ctx.file(".config", "{}".format(ctx.path(ctx.attr._nodejs)))
    ctx.file("BUILD.bazel", """
filegroup(
    name = "config",
    srcs = [".config"],
    visibility = ["//visibility:public"],
)
""")

test_repository = repository_rule(
    _test_repository_impl,
    attrs = {
        "_nodejs": attr.label(
            default = Label("@nodejs//:node_bin"),
            executable = True,
            cfg = "exec"
        )
    }
)
