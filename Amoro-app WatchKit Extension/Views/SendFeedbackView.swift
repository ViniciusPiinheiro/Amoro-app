//
//  SendFeedbackView.swift
//  Amoro-app WatchKit Extension
//
//  Created by Vinícius Pinheiro on 04/03/21.
//

import SwiftUI

struct SendFeedbackView: View {
    var body: some View {
        VStack {
            Image("Sample")
            Text("Sua Mensagem")
                .multilineTextAlignment(.center)
                .font(.system(size: 17))
            HStack {
                Text("enviada")
                    .bold()
                    .font(.system(size: 17))
                Text("para o seu")
                    .font(.system(size: 17))
            }
            Text("amor")
                .font(.system(size: 17))
        }
    }
    
}

struct SendFeedbackView_Previews: PreviewProvider {
    static var previews: some View {
        SendFeedbackView()
    }
}
