// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
	name: "HackAssembler",
	dependencies: [
		.package(path: "Parser"),
    .package(path: "Code")
	],
	targets: [
		.target(
			name: "HackAssembler",
			dependencies: ["Parser", "Code"]),
		.testTarget(
			name: "HackAssemblerTests",
			dependencies: ["HackAssembler"]),
	]
)
