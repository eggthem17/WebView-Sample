//
//  WebView.swift
//  WebView Sample
//
//  Created by MinKyu CHA on 5/12/24.
//

import Foundation
import WebKit
import SwiftUI

struct WebView: UIViewRepresentable {
    @ObservedObject var manager: WebViewManager
    
    func makeUIView(context: Context) -> WKWebView {
        return manager.webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    

    class Coordinator: NSObject {
        let parent: WebView
        
        init(parent: WebView) {
            self.parent = parent
        }
    }
}
