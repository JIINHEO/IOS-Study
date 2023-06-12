//
//  UNNotificationCenter.swift
//  ios-alarm
//
//  Created by 허지인 on 2021/11/24.
//

import Foundation
import UserNotifications

extension UNUserNotificationCenter {
    func addNotificationRequest(by alert : Alert) {
        let content = UNMutableNotificationContent()
        content.title = "물마실 시간이에요!!"
        content.body = "세계보건기구가 권장하는 하루 물 섭취량은 1.5~2리터 입니다."
        content.sound = .default
        content.badge = 1
        
        let component = Calendar.current.dateComponents([.hour, .minute], from: alert.date)
        let trigger = UNCalendarNotificationTrigger(dateMatching: component, repeats: alert.isOn)
        let requst = UNNotificationRequest(identifier: alert.id, content: content, trigger: trigger)
        
        self.add(requst, withCompletionHandler: nil)
    }
}
