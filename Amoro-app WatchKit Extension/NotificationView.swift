//
//  NotificationView.swift
//  Amoro-app WatchKit Extension
//
//  Created by Vinícius Pinheiro on 03/03/21.
//

import SwiftUI

struct NotificationView: View {
    var notification: [Message] = []
    @State var bodyMenssage : [Message]?
    //@State var bodyMensagem: Text
    
    var body: some View {
        VStack {
            onAppear(perform: {
                let bodyMenssage = Message(image: "", text: "", roomNumber: 2)
                bodyMenssage.setupCloudKitSubscription() {
                    Operation, error in
                    guard let notificationInfo  = Operation, error == nil else {
                        print("error", error as Any)
                        return
                    }
                    self.bodyMenssage = notificationInfo
                    print(bodyMenssage)
                }}
            )}
                
                Image("Sample")
                Text("Amo voce")
            
            }
        
    }
    
    struct NotificationView_Previews: PreviewProvider {
        static var previews: some View {
            NotificationView()
        }}

