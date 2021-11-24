# ``ApodiniObservePrometheus``

Prometheus metrics configuration and types for the ApodiniObserve module.

<!--
                  
This source file is part of the Apodini open source project

SPDX-FileCopyrightText: 2021 Paul Schmiedmayer and the project authors (see CONTRIBUTORS.md) <paul.schmiedmayer@tum.de>

SPDX-License-Identifier: MIT
             
-->

## Overview

This package drastically simplifies the configuration process for using the common [Prometheus](https://prometheus.io/) software stack with ApodiniObserve. Include the dependency like:
```swift
dependencies: [
    .package(url: "https://github.com/Apodini/ApodiniObservePrometheus.git", from: "0.0.0"),
],
targets: [
    .executableTarget(
        name: "WebService",
        dependencies: [
            .product(name: "Apodini", package: "Apodini"),
            .product(name: "ApodiniObserve", package: "Apodini"),
            .product(name: "ApodiniObservePrometheus", package: "ApodiniObservePrometheus"),
        ]
    ),
]
```

Which enables a way simpler configuration like:

```swift
import Apodini
import ApodiniObserve
import ApodiniObservePrometheus

struct ExampleWebService: WebService {
    var content: some Component {
        // ...
    }
    
    var configuration: Configuration {
        // ...

        // Setup of ApodiniMetrics with a PrometheusMetricsHandler backend
        MetricsConfiguration(
            handlerConfiguration: MetricPullHandlerConfiguration.defaultPrometheus,
            systemMetricsConfiguration: .default
        )
    }
}
```
