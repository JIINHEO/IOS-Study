//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by jiinheo on 2022/09/25.
//

import ProjectDescription
import ProjectDescriptionHelpers

private let projectName = "DesignKit"
private let bundleID = "com.jiin.DesignKit"

let project = Project.app(
  name: projectName,
  product: .staticFramework,
  platform: .iOS,
  dependencies: []
)
