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
    name: "ApodiniObserveMetricsPrometheus",
    platforms: [
        .macOS(.v11)
    ],
    products: [
        .library(name: "ApodiniObserveMetricsPrometheus", targets: ["ApodiniObserveMetricsPrometheus"])
    ],
    ],
    targets: [
        .target(
            name: "ApodiniObserveMetricsPrometheus",
        ),
        .testTarget(
            name: "ApodiniObserveMetricsPrometheusTests",
            dependencies: [
                .target(name: "ApodiniTemplate")
            ]
        )
    ]
)
