@preconcurrency import ProjectDescription

extension TargetDependency {
    public static let common = TargetDependency.project(
        target: "Common",
        path: .relativeToRoot("Core/Common")
    )

    public static let featureA = TargetDependency.project(
        target: "FeatureA",
        path: .relativeToRoot("Feature/FeatureA")
    )

    public static let featureB = TargetDependency.project(
        target: "FeatureB",
        path: .relativeToRoot("Feature/FeatureB")
    )

    public static let featureC = TargetDependency.project(
        target: "FeatureC",
        path: .relativeToRoot("Feature/FeatureC")
    )
}

