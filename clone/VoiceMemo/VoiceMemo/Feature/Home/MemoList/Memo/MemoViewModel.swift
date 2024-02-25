//
//  MemoViewModel.swift
//  VoiceMemo
//
//  Created by jiinheo on 2/21/24.
//

import Foundation

class MemoViewModel: ObservableObject {
    @Published var memo: Memo
    
    init(memo: Memo) {
        self.memo = memo
    }
}
