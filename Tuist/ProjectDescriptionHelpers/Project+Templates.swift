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
            "CFBundleDisplayName": "\(name)",
            "UIMainStoryboardFile": "",
            "UILaunchStoryboardName": "LaunchScreen"
        ]
        
        return .init(
            name: name,
            packages: packages,
            targets: [
                Target(
                    name: "\(name)App",
                    platform: .iOS,
                    product: .app,
                    bundleId: "kr.destudio.fun.\(name)App",
                    infoPlist: .extendingDefault(with: infoPlist),
                    sources: ["Sources/**"],
                    resources: ["Resources/**"],
                    dependencies: dependencies
                ),
                Target(
                    name: "\(name)Tests",
                    platform: .iOS,
                    product: .unitTests,
                    bundleId: "kr.destudio.fun.\(name)Tests",
                    infoPlist: .default,
                    sources: ["Tests/Sources/**.swift"],
                    dependencies: [.target(name: name)]
                )
            ]
        )
    }
}
