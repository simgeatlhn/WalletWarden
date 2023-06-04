//
//  CashflowApp.swift
//  Cashflow
//
//  Created by simge on 17.04.2023.
//

import SwiftUI
import UserNotifications

@main
struct CashflowApp: App {
    var body: some Scene {
        WindowGroup {
            SplashScreen()
                .onAppear(perform: setupNotifications)
        }
    }

    func setupNotifications() {
        let center = UNUserNotificationCenter.current()

        center.requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            if granted {
                let content = UNMutableNotificationContent()
                content.title = "WalletWarden"
                content.body = "Don't forget to track your expenses in the app today!"
                content.sound = UNNotificationSound.default

                var dateComponents = DateComponents()
                dateComponents.hour = 15
                dateComponents.minute = 12

                let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
                
                let request = UNNotificationRequest(identifier: "DailyReminder", content: content, trigger: trigger)
                center.add(request)
            } else {
                print("Bildirimlere izin verilmedi")
            }
        }
    }
}
