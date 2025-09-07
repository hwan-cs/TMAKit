import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: "TMAKit",
    targets: [
        .target(
            name: "TMAKit",
            destinations: .iOS,
            product: .app,
            bundleId: "com.tmakit.tmakit",
            infoPlist: .extendingDefault(
                with: [
                    "CFBundleDisplayName": "TMAKit",
                    "CFBundleShortVersionString": "1.0.0",
                    "CFBundleVersion": "1",
                    "UILaunchStoryboardName": "LaunchScreen",
                ]
            ),
            sources: ["Sources/**"],
            resources: ["Resources/**"],
            dependencies: [
                .featureA,
                .featureB,
                .featureC,
                .external(name: "Moya"),
                .external(name: "Lottie"),
                .external(name: "ComposableArchitecture"),
                .external(name: "Dependencies"),
                .external(name: "FirebaseCrashlytics"),
                .external(name: "FirebaseAnalytics"),
            ]
        ),
        .target(
            name: "TMAKitTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "com.tmakit.tmakitTests",
            infoPlist: .default,
            sources: ["Tests/**"],
            resources: [],
            dependencies: [
                .target(name: "TMAKit")
            ]
        ),
    ]
)
