import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.feature(
    name: "Settings",
    bundleId: bundleId,
    dependencies: [
        .project(target: "ShazamInterface", path: "../Shazam"),
        .project(target: "Networking", path: "../../Core/Networking"),
        .project(target: "Common", path: "../../Core/Common")
    ]
)

