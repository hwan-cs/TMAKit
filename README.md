## TMA Example app

A fully modular Shazam+Lyrics finder iOS application built using Tuist.
This repo demonstrates a real-world implementation of [The Modular Architecture](https://docs.tuist.dev/en/guides/features/projects/tma-architecture) Pattern using feature modules, core modules, interface layers, and example apps for seamless testing and development.

Project Structure
```css
TMAKit
 ├── App/
 │   └── TMAKit (Main App)
 │
 ├── Core/
 │   ├── Common/
 │   ├── Networking/
 │   └── Storage/
 │
 ├── Feature/
 │   ├── Shazam/
 │   ├── Lyrics/
 │   └── Settings/
 │
 ├── Tuist/
 │   ├── ProjectDescriptionHelpers/
 │   │   ├── Project+Helpers.swift
 │   │   └── TargetDependency+TMAKit.swift
 │   └── Package.swift
 │
 ├── Tuist.swift
 └── Workspace.swift
```

### Each module follows:
```css
ModuleName/
 ├── Interface/        // Public Interfaces (protocols, models)
 ├── Sources/          // Actual implementation
 ├── Resources/        // Assets, icons, localizations
 ├── Testing/          // Shared mocks for other modules
 ├── Tests/            // XCTest/Swift Testing targets
 └── Example/          // Example app
```

### 📦 Features

- Fully modularlized
- Example app for feature modules
- Tuist-powered genration and dependency management
- SwiftUI
- CoreData
- ShazamKit
- Moya(Uses lrclib API)


### Use tuist version 4.54.3
```
$ mise use tuist@4.54.3
$ tuist install
$ tuist generate // or tuist generate FeatureA/FeatureB, etc
```

<img width="1381" height="251" alt="graph" src="https://github.com/hwan-cs/TMA_Example/blob/main/graph.png?raw=true" />


### Demo




