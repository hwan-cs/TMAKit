@preconcurrency import ProjectDescription

extension Settings {
    static var `default`: Settings {
        .settings(
            base: [
                "CLANG_ENABLE_MODULE_VERIFIER": "YES",
                "SWIFT_STRICT_CONCURRENCY": "complete",
                "ENABLE_STRICT_OBJC_MSGSEND": "YES",
            ],
            configurations: [
                .debug(
                    name: .debug,
                    settings: [
                        "CLANG_ENABLE_MODULE_VERIFIER": "YES",
                        "SWIFT_COMPILATION_MODE": "singlefile",
                        "SWIFT_OPTIMIZATION_LEVEL": "-Onone"
                    ]
                ),
                .release(
                    name: .release,
                    settings: [
                        "CLANG_ENABLE_MODULE_VERIFIER": "YES",
                        "SWIFT_COMPILATION_MODE": "wholemodule",
                        "SWIFT_OPTIMIZATION_LEVEL": "-O"
                    ]
                )
            ]
        )
    }
}
