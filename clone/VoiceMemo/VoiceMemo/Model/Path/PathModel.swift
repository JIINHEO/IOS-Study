//
//  PathModel.swift
//  VoiceMemo
//
//  Created by jiinheo on 2/4/24.
//

import Foundation

class PathModel: ObservableObject {
    @Published var paths: [PathType]
    
    init(paths: [PathType] = []) {
        self.paths = paths
    }
}
