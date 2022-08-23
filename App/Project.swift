//
//  Project.swift
//  GashaponManifests
//
//  Created by Euigyom Kim on 2022/08/19.
//

import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.app(
	name: "GashaponApp",
	packages: [
		.remote(
			url: "https://github.com/pointfreeco/swift-composable-architecture",
			requirement: .upToNextMajor(from: "0.39.0")
		)
	]
)
