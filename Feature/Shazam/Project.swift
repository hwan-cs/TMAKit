import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.feature(
    name: "Shazam",
    bundleId: bundleId,
    dependencies: [
        .project(target: "Common", path: "../../Core/Common")
    ]
)
