//
//  Todo.swift
//  VoiceMemo
//
//  Created by jiinheo on 2/18/24.
//

import Foundation

struct Todo: Hashable { // foreach에서 값을 가지고 돌려줄거기 때문에
    var title: String
    var time: Date
    var day: Date
    var selected: Bool
    
    var covertedDayAndTime: String {
        // 오늘 - 오후 03:00에 알림
        String("\(day.formattedDay) - \(time.formattedTime)에 알림")
    }
}
