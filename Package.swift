// swift-tools-version:5.4
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "s3listdemo",
    platforms: [
        .macOS(.v10_15),
        .iOS(.v13)
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(
            name: "AWSSwiftSDK",
            url: "https://github.com/awslabs/aws-sdk-swift",
            from: "0.0.11"
        ),
    ],
    targets: [
        // The target of the main executable program
        .executableTarget(
            name: "s3listdemo",
            dependencies: [
                "S3BucketList",
                .product(name: "AWSS3", package: "AWSSwiftSDK"),
            ]
        ),
        // A library target containing the demo's classes
        .target(
            name: "S3BucketList",
            dependencies: [
                .product(name: "AWSS3", package: "AWSSwiftSDK"),
            ]
        ),
        // The target of the tests
        .testTarget(
            name: "S3BucketListTests",
            dependencies: [
                "s3listdemo",
                .product(name: "AWSS3", package: "AWSSwiftSDK"),
            ]
        ),
    ]
)
