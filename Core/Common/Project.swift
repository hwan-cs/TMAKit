import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: "Common",
    targets: [
        .target(
            name: "Common",
            destinations: .iOS,
            product: .framework,
            bundleId: "io.tmakit.tmakit.Common",
            deploymentTargets: Project.minDeploymentVersion,
            infoPlist: .default,
            sources: ["Sources/**"],
            dependencies: [
                .external(name: "ComposableArchitecture"),
                .external(name: "Dependencies")
            ]
        ),
        .target(
            name: "CommonTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "com.tmakit.tmakit.CommonTests",
            infoPlist: .default,
            sources: ["Tests/**"],
            resources: [],
            dependencies: [
                .target(name: "Common")
            ]
        ),
    ]
)
