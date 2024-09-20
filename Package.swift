// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "mac15bug",
    platforms: [.macOS(.v15)],
    products: [
        .executable(name: "app", targets: ["app"]),
    ],
    dependencies: [
        .package(url: "https://github.com/soto-project/soto-core.git", from: "7.0.0"),
        .package(url: "https://github.com/soto-project/soto-codegenerator.git", from: "7.1.1"),
    ],
    targets: [
        .target(
            name: "Soto",
            dependencies: [.product(name: "SotoCore", package: "soto-core")],
            resources: [
                .process("endpoints.json"),
                .process("s3.json"),
                .process("ecs.json"),
                .process("ec2.json")
            ],
            plugins: [.plugin(name: "SotoCodeGeneratorPlugin", package: "soto-codegenerator")]
        ),
        .target(
            name: "MBServices",
            dependencies: [
                .target(name: "Soto"),
            ]
        ),
        .target(
            name: "MBApp",
            dependencies: [
                .target(name: "MBServices"),
            ]
        ),
        .executableTarget(
            name: "app",
            dependencies: [
                .target(name: "MBApp")
            ]
        )
    ]
)
