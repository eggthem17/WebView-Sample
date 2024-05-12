//
//  ContentAreaView.swift
//  WebView Sample
//
//  Created by MinKyu CHA on 5/12/24.
//

import SwiftUI
import UIKit

struct ContentView: View {
    @Binding var url: String
    var webViewManager: WebViewManager
    
    var body: some View {
        if !url.isEmpty {
            WebView(manager: webViewManager)
        } else {
            Spacer()
            
            Text("Invalid URL.")
                .padding()
                .foregroundStyle(.gray)
            
            Spacer()
        }
    }
}

//#Preview {
//    ContentAreaView()
//}
