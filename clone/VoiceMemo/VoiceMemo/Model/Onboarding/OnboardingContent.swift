//
//  OnboardingContent.swift
//  VoiceMemo
//
//  Created by jiinheo on 2/4/24.
//

import Foundation

struct OnboardingContent: Hashable { // 추후에 탭뷰에서도 사용하기 때문에 Hashable
    var imageFileName: String
    var title: String
    var subTitle: String
    
    init(
        imageFileName: String,
         title: String,
         subTitle: String
    ) {
        self.imageFileName = imageFileName
        self.title = title
        self.subTitle = subTitle
    }
}
