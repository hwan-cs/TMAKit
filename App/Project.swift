import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: "TMAKit",
    targets: [
        .target(
            name: "TMAKit",
            destinations: .iOS,
            product: .app,
            bundleId: "com.tmakit.tmakit",
            infoPlist: .extendingDefault(
                with: [
                    "CFBundleDisplayName": "TMAKit",
                    "CFBundleShortVersionString": "1.0.0",
                    "CFBundleVersion": "1",
                    "UILaunchStoryboardName": "LaunchScreen",
                    "NSMicrophoneUsageDescription": "Allow microphone usage for Shazam"
                ]
            ),
            sources: ["Sources/**"],
            resources: ["Resources/**"],
            entitlements: "TMAKit.entitlements",
            dependencies: [
                .shazam,
                .shazamInterface,
                .lyrics,
                .lyricsInterface,
                .settings,
                .settingsInterface,
                .common,
                .commonInterface,
                .networking,
                .storage,
                .storageInterface
            ],
            settings: .settings(
                base: SettingsDictionary()
                    .codeSignIdentityAppleDevelopment()
                    .automaticCodeSigning(devTeam: "6DXT245L5T"),
                configurations: [],
                defaultSettings: .recommended
            )
        ),
        .target(
            name: "TMAKitTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "com.tmakit.tmakitTests",
            infoPlist: .default,
            sources: ["Tests/**"],
            resources: [],
            dependencies: [
                .target(name: "TMAKit")
            ]
        ),
    ]
)
