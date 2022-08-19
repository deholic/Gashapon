//
//  Project+Templates.swift
//  GashaponManifests
//
//  Created by Euigyom Kim on 2022/08/19.
//

import ProjectDescription

extension Project {
    public static func app(name: String, dependencies: [TargetDependency] = []) -> Project {
        .init(
            name: name,
            targets: [
                Target(
                    name: name,
                    platform: .iOS,
                    product: .app,
                    bundleId: "kr.destudio.fun.Gashapon\(name)",
                    infoPlist: .default,
                    sources: ["Sources/**"],
                    resources: ["Resources/**"],
                    dependencies: dependencies
                ),
                Target(
                    name: "\(name)Tests",
                    platform: .iOS,
                    product: .unitTests,
                    bundleId: "kr.destudio.fun.Gashapon\(name)Tests",
                    infoPlist: .default,
                    sources: ["Tests/Sources/**.swift"],
                    resources: ["Tests/Resources/**"],
                    dependencies: [.target(name: name)]
                )
            ]
        )
    }
}
