//
//  PairingFeedbackView.swift
//  Amoro-app WatchKit Extension
//
//  Created by Vinícius Pinheiro on 04/03/21.
//

import SwiftUI

struct PairingFeedbackView: View {
    var body: some View {
        VStack {
            Image("Sample")
            Text("Você e seu amor")
                .multilineTextAlignment(.center)
                .font(.system(size: 17))
            Text("agora estão")
                .font(.system(size: 17))
            Text("conectados")
                .bold()
                .font(.system(size: 17))
        }
    }
}


struct PairingFeedbackView_Previews: PreviewProvider {
    static var previews: some View {
        PairingFeedbackView()
    }
}
