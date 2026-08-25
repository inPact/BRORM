// swift-tools-version:5.9
// SPM manifest for the Tabit fork of BRORM (TAB-49622).
//
// Upstream (brototyp/BRORM) is dormant since 2014 and never shipped SPM,
// so this fork carries a hand-written manifest. The repo is upstream's
// demo app; like the podspec, the target carves out the 6-file library
// (BRModel, BROrm, NSString+Inflections) and excludes everything else —
// including BRSegmentedString, which the podspec's "BRSegmetedString"
// typo has always kept out of the pod (surface parity, kept deliberate).
// FMDB is consumed from upstream, which ships native SPM support.

import PackageDescription

let package = Package(
    name: "BRORM",
    platforms: [.iOS(.v15)],
    products: [
        .library(name: "BRORM", targets: ["BRORM"])
    ],
    dependencies: [
        .package(url: "https://github.com/ccgus/fmdb.git", from: "2.7.12")
    ],
    targets: [
        .target(
            name: "BRORM",
            dependencies: [.product(name: "FMDB", package: "fmdb")],
            path: "BROrm",
            exclude: [
                "Example",
                "Images.xcassets",
                "en.lproj",
                "BRAppDelegate.h",
                "BRAppDelegate.m",
                "main.m",
                "BROrm-Info.plist",
                "BROrm-Prefix.pch",
                "BRSegmentedString.h",
                "BRSegmentedString.m"
            ],
            publicHeadersPath: "."
        )
    ]
)
