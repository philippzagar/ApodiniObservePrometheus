<!--

This source file is part of the Apodini open source project

SPDX-FileCopyrightText: 2021 Paul Schmiedmayer and the project authors (see CONTRIBUTORS.md) <paul.schmiedmayer@tum.de>

SPDX-License-Identifier: MIT

-->

# ApodiniObservePrometheus

[![Build](https://github.com/Apodini/ApodiniObservePrometheus/actions/workflows/build.yml/badge.svg)](https://github.com/Apodini/ApodiniObservePrometheus/actions/workflows/build.yml)
[![codecov](https://codecov.io/gh/Apodini/ApodiniObservePrometheus/branch/develop/graph/badge.svg?token=5MMKMPO5NR)](https://codecov.io/gh/Apodini/ApodiniObservePrometheus)

ApodiniObservePrometheus is a [Apodini](https://github.com/Apodini/Apodini) extension that drastically simplifies the configuration process for using the common [Prometheus](https://prometheus.io/) software stack with ApodiniObserve.

## Integration

To use ApodiniObservePrometheus, you have to add it as a Swift Package dependency to your web service package. As ApodiniObservePrometheus is extending [Apodini](https://github.com/Apodini/Apodini) it also currently uses `0.x` releases and every minor version number increment could include breaking changes. Therefore using `.upToNextMinor(from: "0.0.0")` is advised:

```swift
dependencies: [
    .package(url: "https://github.com/Apodini/ApodiniObservePrometheus.git", .upToNextMinor(from: "0.0.0"))
]
````

Next, add ApodiniObservePrometheus as a target dependency to your web service target:

```swift
targets: [
    .executableTarget(
        name: "WebService",
        dependencies: [
            .product(name: "Apodini", package: "Apodini"),
            .product(name: "ApodiniObserve", package: "Apodini"),
            .product(name: "ApodiniObservePrometheus", package: "ApodiniObservePrometheus")
        ]
    )
]
```

## Usage

You can use ApodiniObservePrometheus as follows:

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

## Contributing
Contributions to this project are welcome. Please make sure to read the [contribution guidelines](https://github.com/Apodini/.github/blob/main/CONTRIBUTING.md) and the [contributor covenant code of conduct](https://github.com/Apodini/.github/blob/main/CODE_OF_CONDUCT.md) first.

## License
This project is licensed under the MIT License. See [Licenses](https://github.com/Apodini/ApodiniObservePrometheus/tree/develop/LICENSES) for more information.
