@preconcurrency import ProjectDescription

extension Project {
    
    public static let destinations: ProjectDescription.Destinations = [.iPhone]
    
    public static let minDeploymentVersion: DeploymentTargets = .iOS("18.0")
    
    public static func resolvedProductType() -> ProjectDescription.Product {
        if Environment.isDynamic.getBoolean(default: false) {
            return .framework
        } else {
            return .staticFramework
        }
    }
    
    public static func featureFramework(
        name: String,
        dependencies: [TargetDependency] = []
    ) -> Project {
            return Project(
                name: name,
                options: .options(
                    disableSynthesizedResourceAccessors: true
                ),
                targets: [
                    frameworkTarget(
                        name: name,
                        dependencies: dependencies + featureTargetDependencies),
                    testTarget(
                        name: name
                    )
                ]
            )
        }
    
    public static func featureFrameworkWithApp(
        name: String,
        dependencies: [TargetDependency] = []
    ) -> Project {
            return Project(
                name: name,
                options: .options(
                    disableSynthesizedResourceAccessors: true
                ),
                targets: [
                    frameworkTarget(
                        name: name,
                        dependencies: dependencies + featureTargetDependencies
                    ),
                    applicationTarget(
                        name: name,
                        dependencies: dependencies + featureTargetDependencies
                    ),
                    testTarget(
                        name: name
                    )
                ]
            )
        }
    
    static func frameworkTarget(
        name: String,
        dependencies: [TargetDependency] = []
    ) -> Target {
        return Target.target(
            name: name,
            destinations: Project.destinations,
            product: resolvedProductType(),
            bundleId: "com.tmakit.tmakit.\(name)",
            deploymentTargets: Project.minDeploymentVersion,
            sources: [
                "Sources/**"
            ],
            resources: [
                "Resources/**"
            ],
            dependencies: dependencies
        )
    }
    
    static func applicationTarget(
        name: String,
        dependencies: [TargetDependency] = []
    ) -> Target {
        .target(
            name: "\(name)App",
            destinations: Project.destinations,
            product: .app,
            bundleId: "com.tmakit.tmakit.\(name)App",
            deploymentTargets: Project.minDeploymentVersion,
            infoPlist: .extendingDefault(
                with: [
                    "CFBundleDisplayName": "\(name)",
                    "CFBundleShortVersionString": "1.0.0",
                    "CFBundleVersion": "1",
                    "UILaunchStoryboardName": "LaunchScreen",
                ]
            ),
            sources: [
                "App/**"
            ],
            resources: [
                "Resources/**"
            ],
            dependencies: [
                .target(
                    name: name
                )
            ] + appDependencies
        )
    }
    
    static func testTarget(name: String) -> Target {
        .target(
            name: "\(name)Tests",
            destinations: Project.destinations,
            product: .unitTests,
            bundleId: "com.tmakit.tmakit.\(name)Tests",
            sources: [
                "Tests/**"
            ],
            dependencies: [
                .target(
                    name: name
                )
            ]
        )
    }
    
    public static var featureTargetDependencies: [TargetDependency] {
        [
            .common,
            .external(name: "Moya"),
            .external(name: "ComposableArchitecture"),
            .external(name: "Dependencies"),
            .external(name: "FirebaseCrashlytics"),
            .external(name: "FirebaseAnalytics"),
        ]
    }

    public static var appDependencies: [TargetDependency] {
        [
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
    }
}
