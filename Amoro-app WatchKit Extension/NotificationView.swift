//
//  NotificationView.swift
//  Amoro-app WatchKit Extension
//
//  Created by Vinícius Pinheiro on 03/03/21.
//

import SwiftUI

struct NotificationView: View {
//    var notification: [Message] = []
//    @State var bodyMenssage : [Message]?
    
    //@State var bodyMensagem: Text
   // @State var messageImage: String
  //  var messageText: String
//    @State private var iconNumber = 1
//    @State private var icons = ["animateIcon","sadIcon","thirstyIcon","beatIcon1", "cuteIcon1", "funnyIcon1", "hotIcon1"]
    //@State private var message = Message(image: "", text: "", roomNumber: 0)
    @State private var pushActive = false
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
//                message = Message(image: "", text: "", roomNumber: 0)
//                message.readRecords() {
//                    messageImage, error in
//                     guard let record = messageImage, error == nil else {
//                                print("error", error as Any)
//                        return
//                    }
//                    self.messageImage = record
//
////
//                    }
//
            })
            
            
//            ZStack {
//                Image("principalCircle")
//                    .resizable()
//                    .frame(width: 90, height: 90, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
//                Image(messageImage)
//                    .resizable()
//                    .frame(width: messageImage == "cuteIcon1" ? 44 : 48.5, height: 40, alignment: .center)
//                    .padding(.bottom, 20)
            
            
            }
//            onAppear(perform: {
//                let bodyMenssage = Message(image: "", text: "", roomNumber: 2)
//                bodyMenssage.setupCloudKitSubscription() {
//                    Operation, error in
//                    guard let notificationInfo  = Operation, error == nil else {
//                        print("error", error as Any)
//                        return
//                    }
//                    self.bodyMenssage = notificationInfo
//                    print(bodyMenssage)
//                }}
//            )}
                
    }}
    
    
    struct NotificationView_Previews: PreviewProvider {
        static var previews: some View {
            NotificationView()
        }}

