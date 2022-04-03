//
//  ListenToNotificationChanges.swift
//  SwiftuILists
//
//  Created by paige on 2022/04/03.
//

import SwiftUI

fileprivate let kTaskAddedNotification: String = "TaskAddedNotification"

extension Notification.Name {
    static let taskAddedNotification = Notification.Name(kTaskAddedNotification)
}

struct ListenToNotificationChanges: View {
    
    @State private var newTask: String?
    
    var body: some View {
        VStack {
            
            Button("Post Notification") {
                NotificationCenter.default.post(name: Notification.Name.taskAddedNotification, object: "Wash the car")
            }
            
            Text(newTask ?? "no task received")
                .onReceive(NotificationCenter.default.publisher(for: Notification.Name.taskAddedNotification)) {
                    newTask = $0.object as? String
                }
            
        }
    }
    
}

struct ListenToNotificationChanges_Previews: PreviewProvider {
    static var previews: some View {
        ListenToNotificationChanges()
    }
}
