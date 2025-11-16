@preconcurrency import ProjectDescription

extension TargetDependency {
    
    // MARK: - Core Dependencies
    static func core(_ name: String) -> TargetDependency {
        .project(target: name, path: "../Core/\(name)")
    }
    
    static func coreInterface(_ name: String) -> TargetDependency {
        .project(target: "\(name)Interface", path: "../Core/\(name)")
    }
    
    // MARK: - Feature Dependencies
    static func feature(_ name: String) -> TargetDependency {
        .project(target: name, path: "../Feature/\(name)")
    }
    
    static func featureInterface(_ name: String) -> TargetDependency {
        .project(target: "\(name)Interface", path: "../Feature/\(name)")
    }
    
    public static var common: TargetDependency { .core("Common") }
    public static var commonInterface: TargetDependency { .coreInterface("Common") }
    public static var networking: TargetDependency { .core("Networking") }
    public static var storage: TargetDependency { .core("Storage") }
    public static var storageInterface: TargetDependency { .coreInterface("Storage") }
    
    public static var shazam: TargetDependency { .feature("Shazam") }
    public static var shazamInterface: TargetDependency { .featureInterface("Shazam") }
    
    public static var lyrics: TargetDependency { .feature("Lyrics") }
    public static var lyricsInterface: TargetDependency { .featureInterface("Lyrics") }
    
    public static var settings: TargetDependency { .feature("Settings") }
    public static var settingsInterface: TargetDependency { .featureInterface("Settings") }
}

