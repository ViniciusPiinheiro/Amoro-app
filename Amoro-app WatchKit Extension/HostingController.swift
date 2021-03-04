//
//  HostingController.swift
//  Amoro-app WatchKit Extension
//
//  Created by Vinícius Pinheiro on 03/03/21.
//

import WatchKit
import Foundation
import SwiftUI

class HostingController: WKHostingController<StartView> {
    override var body: StartView {
        return StartView()
    }
}
