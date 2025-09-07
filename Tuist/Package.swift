// swift-tools-version: 6.0
@preconcurrency import PackageDescription

#if TUIST
    import ProjectDescription
    import ProjectDescriptionHelpers

    let packageSettings = PackageSettings(
        productTypes: [
            "Moya": Project.resolvedProductType(),
            "Lottie": Project.resolvedProductType(),
            "Dependencies": Project.resolvedProductType(),
            "FirebaseAnalytics": Project.resolvedProductType(),
            "FirebaseCrashlytics": Project.resolvedProductType(),
            "ComposableArchitecture": Project.resolvedProductType()
         ]
    )
#endif

let package = Package(
    name: "TMAKit",
    dependencies: [
         .package(url: "https://github.com/Moya/Moya.git", from: "15.0.3"),
         .package(url: "https://github.com/airbnb/lottie-ios.git", .upToNextMajor(from: "4.0.0")),
         .package(url: "https://github.com/firebase/firebase-ios-sdk", from: "10.21.0"),
         .package(url: "https://github.com/pointfreeco/swift-composable-architecture", from: "1.12.1"),
         .package(url: "https://github.com/pointfreeco/swift-dependencies", from: "1.9.3")
    ]
)
