import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: "FeatureB",
    targets: [
        .target(
            name: "FeatureB",
            destinations: .iOS,
            product: .framework,
            bundleId: "com.tmakit.tmakit.FeatureB",
            infoPlist: .default,
            sources: ["Sources/**"],
            resources: ["Resources/**"],
            dependencies: [
                .common,
                .featureA,
                .external(name: "Moya"),
                .external(name: "Lottie"),
                .external(name: "ComposableArchitecture"),
                .external(name: "Dependencies")
            ]
        ),
        .target(
            name: "FeatureBTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "com.tmakit.tmakit.FeatureBTests",
            infoPlist: .default,
            sources: ["Tests/**"],
            resources: [],
            dependencies: [
                .target(name: "FeatureB")
            ]
        ),
    ]
)

