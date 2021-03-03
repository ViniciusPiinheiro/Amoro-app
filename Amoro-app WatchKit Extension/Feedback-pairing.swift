//
//  Feedback-Pairing.swift
//  Amoro-app
//
//  Created by Vinícius Pinheiro on 03/03/21.
//

import SwiftUI

struct Feedback_Pairing: View {
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

struct Feedback_Pairing_Previews: PreviewProvider {
    static var previews: some View {
        Feedback_Pairing()
    }
}
