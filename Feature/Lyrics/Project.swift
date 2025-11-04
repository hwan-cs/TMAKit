import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.feature(
    name: "Lyrics",
    bundleId: bundleId,
    dependencies: [
        .project(target: "Networking", path: "../../Core/Networking"),
        .project(target: "Common", path: "../../Core/Common"),
        .project(target: "Storage", path: "../../Core/Storage")
    ]
)

