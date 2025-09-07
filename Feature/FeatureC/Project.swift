import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.featureFrameworkWithApp(
    name: "FeatureC",
    dependencies: [
        .featureA,
    ]
)

