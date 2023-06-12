//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by jiinheo on 2022/09/25.
//

import ProjectDescription
import ProjectDescriptionHelpers

private let projectName = "Home"
private let bundleID = "com.jiin.Home"

let project = Project.app(
  name: projectName,
  product: .staticFramework,
  platform: .iOS,
  dependencies: [
    .project(target: "APIKit", path: .relativeToManifest("../../APIKit")),
    .project(target: "DesignKit", path: .relativeToManifest("../../DesignKit")),
  ]
)
