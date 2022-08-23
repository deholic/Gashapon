//
//  Project+Templates.swift
//  GashaponManifests
//
//  Created by Euigyom Kim on 2022/08/19.
//

import ProjectDescription

extension Project {
    public static func app(name: String, packages: [Package] = [], dependencies: [TargetDependency] = []) -> Project {
        let infoPlist: [String: InfoPlist.Value] = [
            "CFBundleShortVersionString": "1.0",
            "CFBundleVersion": "1",
            "UIMainStoryboardFile": "",
            "UILaunchStoryboardName": "LaunchScreen"
        ]
        
        return .init(
            name: name,
            packages: packages,
            targets: [
                Target(
                    name: name,
                    platform: .iOS,
                    product: .app,
                    bundleId: "kr.destudio.fun.Gashapon\(name)",
                    infoPlist: .extendingDefault(with: infoPlist),
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
                    dependencies: [.target(name: name)]
                )
            ]
        )
    }
}
