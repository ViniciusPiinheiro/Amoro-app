//
//  NotificationView.swift
//  Amoro-app WatchKit Extension
//
//  Created by Vinícius Pinheiro on 03/03/21.
//

import SwiftUI

struct NotificationView: View {
    
    var body: some View {
        
        VStack {
            onAppear(perform: {
                if UserDefaults.standard.object(forKey: "subscriptionID") == nil {
                    let message = Message(image: "", text: "", roomNumber: 0)
                    message.setupCloudKitSubscription() {
                        error in
                        if error != nil {
                            print(error!)
                        }
                    }
                }
                
            })
        }
        
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView()
    }}

