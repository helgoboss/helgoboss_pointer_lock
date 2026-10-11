// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "helgoboss_pointer_lock",
    platforms: [.macOS("10.15")],
    products: [
        .library(name: "helgoboss-pointer-lock", targets: ["helgoboss_pointer_lock"])
    ],
    dependencies: [
        .package(name: "FlutterFramework", path: "../FlutterFramework")
    ],
    targets: [
        .target(
            name: "helgoboss_pointer_lock",
            dependencies: [
                .product(name: "FlutterFramework", package: "FlutterFramework")
            ],
            resources: [.process("PrivacyInfo.xcprivacy")]
        )
    ]
)
