//
//  Project.swift
//  ios-tuist-studyManifests
//
//  Created by jiinheo on 2022/09/25.
//

import ProjectDescription
import ProjectDescriptionHelpers

private let projectName = "MisoWeather"
private let bundleID = "com.jiin.misoweather"
private let iOSTargetVersion = "15.0"

let project = Project.app(
  name: projectName,
  product: .app,
  platform: .iOS,
  dependencies: [
    .project(target: "Home", path: .relativeToManifest("../Feature/Home"))
  ]
)

