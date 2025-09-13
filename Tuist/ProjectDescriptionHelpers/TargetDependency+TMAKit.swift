@preconcurrency import ProjectDescription

extension TargetDependency {
    public static let common = TargetDependency.project(
        target: "Common",
        path: .relativeToRoot("Core/Common")
    )
    
    public static let networking = TargetDependency.project(
        target: "Networking",
        path: .relativeToRoot("Core/Networking")
    )

    public static let shazam = TargetDependency.project(
        target: "Shazam",
        path: .relativeToRoot("Feature/Shazam")
    )
    
    public static let shazamInterface = TargetDependency.project(
        target: "ShazamInterface",
        path: .relativeToRoot("Feature/Shazam")
    )

    public static let lyrics = TargetDependency.project(
        target: "Lyrics",
        path: .relativeToRoot("Feature/Lyrics")
    )
    
    public static let lyricsInterface = TargetDependency.project(
        target: "LyricsInterface",
        path: .relativeToRoot("Feature/Lyrics")
    )

    public static let settings = TargetDependency.project(
        target: "Settings",
        path: .relativeToRoot("Feature/Settings")
    )
    
    public static let settingsInterface = TargetDependency.project(
        target: "SettingsInterface",
        path: .relativeToRoot("Feature/Settings")
    )
}

