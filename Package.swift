// swift-tools-version:5.5

//
// This source file is part of the Apodini open source project
// 
// SPDX-FileCopyrightText: 2021 Paul Schmiedmayer and the project authors (see CONTRIBUTORS.md) <paul.schmiedmayer@tum.de>
//
// SPDX-License-Identifier: MIT
//

import PackageDescription


let package = Package(
    name: "ApodiniObservePrometheus",
    platforms: [
        .macOS(.v11)
    ],
    products: [
        .library(name: "ApodiniObservePrometheus", targets: ["ApodiniObservePrometheus"])
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-docc-plugin", from: "1.0.0"),
        .package(url: "https://github.com/philippzagar/Apodini", .branchItem("develop")),
        .package(url: "https://github.com/apple/swift-metrics.git", .upToNextMinor(from: "2.2.0")),
        .package(url: "https://github.com/swift-server-community/SwiftPrometheus.git", .revisionItem("7e0cf8f913ed4353462bd4ad46f1db1b34c28a82"))
    ],
    targets: [
        .target(
            name: "ApodiniObservePrometheus",
            dependencies: [
                .product(name: "Apodini", package: "Apodini"),
                .product(name: "ApodiniObserve", package: "Apodini"),
                .product(name: "Metrics", package: "swift-metrics"),
                .product(name: "SwiftPrometheus", package: "SwiftPrometheus")
            ]
        ),
        .testTarget(
            name: "ApodiniObservePrometheusTests",
            dependencies: [
                .target(name: "ApodiniObservePrometheus"),
                .product(name: "XCTApodiniObserve", package: "Apodini"),
                .product(name: "XCTApodini", package: "Apodini"),
                .product(name: "ApodiniHTTP", package: "Apodini")
            ]
        )
    ]
)
