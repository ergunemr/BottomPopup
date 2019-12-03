// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "BottomPopup",
    platforms: [
        .macOS(.v10_12), .iOS(.v10),
    ],
    products: [
        .library(name: "BottomPopup", targets: ["BottomPopup"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
    ],
    targets: [
        .target(name: "BottomPopup", path: "BottomPopup/BottomPopupController/"),
    ]
)