//
//  ContentController.swift
//  WebView Sample
//
//  Created by MinKyu CHA on 5/12/24.
//

import Foundation
import WebKit

class ContentController: NSObject, WKScriptMessageHandler {
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        if message.name == "serverEvent" {
            print("message name : \(message.name)")
            print("post Message : \(message.body)")
        }
    }
}
