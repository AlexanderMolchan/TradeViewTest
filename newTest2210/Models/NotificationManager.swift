//
//  NotificationManager.swift
//  newTest2210
//
//  Created by Александр Молчан on 21.10.23.
//

import UIKit

final class NotificationManager {
    private let notificationCenter = UNUserNotificationCenter.current()
    
    func requestNotifications() {
        notificationCenter.requestAuthorization(options: [.sound, .badge, .alert]) { access, error in
            if access {
                print("All is good")
            }
        }
    }
    
}
