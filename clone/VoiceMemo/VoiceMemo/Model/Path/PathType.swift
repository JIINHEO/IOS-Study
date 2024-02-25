//
//  PathType.swift
//  VoiceMemo
//
//  Created by jiinheo on 2/4/24.
//

enum PathType: Hashable {
    case homeView
    case todoView
    case memoView(isCreateMode: Bool, memo: Memo?)
}
