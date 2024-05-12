//
//  WebViewManager.swift
//  WebView Sample
//
//  Created by MinKyu CHA on 5/12/24.
//

import Foundation
import SwiftUI
import WebKit

class WebViewManager: ObservableObject {
    var webView: WKWebView = WKWebView()
    
    init() {
        let contentController = WKUserContentController()
        contentController.add(ContentController(), name: "serverEvent")
        
        let configuration = WKWebViewConfiguration()
        configuration.userContentController = contentController
        
        self.webView = WKWebView(frame: .zero, configuration: configuration)
    }
    
    func loadRequest(url: URL) {
        let request = URLRequest(url: url)
        webView.load(request)
    }
    
    func callJSFunction() {
        webView.evaluateJavaScript("iOSToJavaScript()") { result, error in
            if let error = error {
                print("JavaScript Error: \(error.localizedDescription)")
            } else if let result = result {
                print("JavaScript Result: \(result)")
            } else {
                print("JavaScript call returned no result.")
            }
        }
    }
    
    deinit {
        webView.configuration.userContentController.removeScriptMessageHandler(forName: "serverEvent")
    }
}
