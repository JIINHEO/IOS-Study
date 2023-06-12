//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by jiinheo on 2022/09/25.
//

import ProjectDescription
import ProjectDescriptionHelpers

private let projectName = "APIKit"
private let bundleID = "com.jiin.APIKit"

let project = Project.app(
  name: projectName,
  product: .staticFramework,
  platform: .iOS,
  dependencies: []
)
