// swift-tools-version: 6.0
@preconcurrency import PackageDescription

#if TUIST
    import ProjectDescription
    import ProjectDescriptionHelpers

    let packageSettings = PackageSettings(
        productTypes: [
            "Moya": .framework
        ]
    )
#endif

let package = Package(
    name: "TMAKit",
    dependencies: [
         .package(url: "https://github.com/Moya/Moya.git", from: "15.0.3")
    ]
)
