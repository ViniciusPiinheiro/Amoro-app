//
//  PairingFeedbackView.swift
//  Amoro-app WatchKit Extension
//
//  Created by Vinícius Pinheiro on 04/03/21.
//

import SwiftUI

struct PairingFeedbackView: View {
    
    var body: some View {
        GeometryReader { geometry in
            if geometry.size.width > 324.0/2.0 {
                PairingView()
                    .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
                    .padding(.leading, 32.0)
            } else if geometry.size.width > 272.0/2.0 {
                PairingView()
                    .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
                    .padding(.leading, 19.0)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}


struct PairingFeedbackView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PairingFeedbackView()
                .previewDevice("Apple Watch Series 5 - 44mm")
            PairingFeedbackView()
                .previewDevice("Apple Watch Series 5 - 40mm")
        }
    }
}
