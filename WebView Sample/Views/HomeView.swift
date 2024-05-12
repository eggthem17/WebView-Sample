//
//  ContentView.swift
//  WebView Sample
//
//  Created by MinKyu CHA on 5/12/24.
//

import SwiftUI

struct HomeView: View {
    @State private var inputURL: String = ""
//    @State private var url: URL?
    @ObservedObject var webViewManager = WebViewManager()
    
    var body: some View {
        VStack {
            TopBar(inputURL: $inputURL, webViewManager: webViewManager)
            
            ContentView(url: $inputURL, webViewManager: webViewManager)
            
            if inputURL == "https://eggthem17.github.io/wkwebkitsample/" {
                Button("Call JavaScript Function") {
                    webViewManager.callJSFunction()
                }
                .padding()
                .background(Color.green)
                .foregroundColor(.white)
                .cornerRadius(8)
            }
        }
    }
}

#Preview {
    HomeView()
}
