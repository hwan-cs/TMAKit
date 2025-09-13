@preconcurrency import ProjectDescription

public let bundleId = "com.tmakit.tmakit"

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
    
    // MARK: - Project Factory for TMA
    public static func feature(
        name: String,
        bundleId: String,
        dependencies: [TargetDependency] = []
    ) -> Project {
        let targets = makeFeatureTargets(
            name: name,
            bundleId: bundleId,
            dependencies: dependencies
        )
        
        return Project(
            name: name,
            targets: targets
        )
    }
    
    public static func core(
        name: String,
        bundleId: String,
        dependencies: [TargetDependency] = []
    ) -> Project {
        let targets = makeCoreTargets(
            name: name,
            bundleId: bundleId,
            dependencies: dependencies
        )
        
        return Project(
            name: name,
            targets: targets
        )
    }
}

//MARK: - Target Factory
func makeFeatureTargets(
    name: String,
    bundleId: String,
    dependencies: [TargetDependency]
) -> [Target] {
    
    let interfaceTarget = Target.target(
        name: "\(name)Interface",
        destinations: Project.destinations,
        product: Project.resolvedProductType(),
        bundleId: "\(bundleId).\(name)Interface",
        deploymentTargets: Project.minDeploymentVersion,
        infoPlist: .default,
        sources: ["Interface/**"],
        dependencies: [],
        settings: .default
    )
    
    let featureTarget = Target.target(
        name: name,
        destinations: Project.destinations,
        product: Project.resolvedProductType(),
        bundleId: "\(bundleId).\(name)",
        deploymentTargets: Project.minDeploymentVersion,
        infoPlist: .default,
        sources: ["Sources/**"],
        resources: ["Resources/**"],
        dependencies: [
            .target(name: "\(name)Interface")
        ] + dependencies,
        settings: .default
    )
    
    let testingTarget = Target.target(
        name: "\(name)Testing",
        destinations: Project.destinations,
        product: Project.resolvedProductType(),
        bundleId: "\(bundleId).\(name)Testing",
        deploymentTargets: Project.minDeploymentVersion,
        infoPlist: .default,
        sources: ["Testing/**"],
        dependencies: [
            .target(name: "\(name)Interface")
        ],
        settings: .default
    )
    
    let testsTarget = Target.target(
        name: "\(name)Tests",
        destinations: Project.destinations,
        product: Project.resolvedProductType(),
        bundleId: "\(bundleId).\(name)Tests",
        deploymentTargets: Project.minDeploymentVersion,
        infoPlist: .default,
        sources: ["Tests/**"],
        dependencies: [
            .target(name: name),
            .target(name: "\(name)Testing"),
            .xctest
        ],
        settings: .default
    )
    
    let exampleTarget = Target.target(
        name: "\(name)Example",
        destinations: Project.destinations,
        product: .app,
        bundleId: "\(bundleId).\(name).example",
        deploymentTargets: Project.minDeploymentVersion,
        infoPlist: .extendingDefault(with: [
            "CFBundleDisplayName": "\(name)",
            "CFBundleShortVersionString": "1.0.0",
            "CFBundleVersion": "1",
            "UILaunchStoryboardName": "LaunchScreen",
        ]),
        sources: ["Example/**"],
        dependencies: [
            .target(name: name),
            .target(name: "\(name)Testing")
        ],
        settings: .default
    )
    
    return [
        interfaceTarget,
        featureTarget,
        testingTarget,
        testsTarget,
        exampleTarget
    ]
}

//MARK: - Target Factory
func makeCoreTargets(
    name: String,
    bundleId: String,
    dependencies: [TargetDependency]
) -> [Target] {
    
    let coreTarget = Target.target(
        name: name,
        destinations: Project.destinations,
        product: Project.resolvedProductType(),
        bundleId: "\(bundleId).\(name)",
        deploymentTargets: Project.minDeploymentVersion,
        infoPlist: .default,
        sources: ["Sources/**"],
        resources: ["Resources/**"],
        dependencies: dependencies,
        settings: .default
    )
    
    let testingTarget = Target.target(
        name: "\(name)Testing",
        destinations: Project.destinations,
        product: Project.resolvedProductType(),
        bundleId: "\(bundleId).\(name)Testing",
        deploymentTargets: Project.minDeploymentVersion,
        infoPlist: .default,
        sources: ["Testing/**"],
        dependencies: [],
        settings: .default
    )
    
    let testsTarget = Target.target(
        name: "\(name)Tests",
        destinations: Project.destinations,
        product: Project.resolvedProductType(),
        bundleId: "\(bundleId).\(name)Tests",
        deploymentTargets: Project.minDeploymentVersion,
        infoPlist: .default,
        sources: ["Tests/**"],
        dependencies: [
            .target(name: name),
            .target(name: "\(name)Testing"),
            .xctest
        ],
        settings: .default
    )
    
    let exampleTarget = Target.target(
        name: "\(name)Example",
        destinations: Project.destinations,
        product: .app,
        bundleId: "\(bundleId).\(name).example",
        deploymentTargets: Project.minDeploymentVersion,
        infoPlist: .extendingDefault(with: [
            "CFBundleDisplayName": "\(name)",
            "CFBundleShortVersionString": "1.0.0",
            "CFBundleVersion": "1",
            "UILaunchStoryboardName": "LaunchScreen",
        ]),
        sources: ["Example/**"],
        dependencies: [
            .target(name: name),
            .target(name: "\(name)Testing")
        ],
        settings: .default
    )
    
    return [
        coreTarget,
        testingTarget,
        testsTarget,
        exampleTarget
    ]
}
