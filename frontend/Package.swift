// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "WavelengthWatchApp",
    platforms: [
        .watchOS(.v10),
        .macOS(.v13)
    ],
    products: [
        .executable(
            name: "WavelengthWatchApp",
            targets: ["WavelengthWatchApp"]
        )
    ],
    targets: [
        .executableTarget(
            name: "WavelengthWatchApp",
            path: "Sources/WavelengthWatchApp"
        )
    ]
)
