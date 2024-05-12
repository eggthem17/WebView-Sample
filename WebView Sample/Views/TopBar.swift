//
//  TopBar.swift
//  WebView Sample
//
//  Created by MinKyu CHA on 5/12/24.
//

import SwiftUI

struct TopBar: View {
    @Binding var inputURL: String
    
    @State var inputString: String = ""
    
    var webViewManager: WebViewManager
    
    @FocusState private var isFocused: Bool
    
    var body: some View {
        HStack {
            TextField("Enter URL", text: $inputString)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .onSubmit {
                    isFocused = false
                    
                    guard !inputString.isEmpty else { return }
                    
                    validateAndUpdateURL()
                    
                    if let url = URL(string: inputURL) {
                        webViewManager.loadRequest(url: url)
                    }
                }
            
            Button {
                guard !inputString.isEmpty else { return }
                
                validateAndUpdateURL()
                
                if let url = URL(string: inputURL) {
                    webViewManager.loadRequest(url: url)
                }
            } label: {
                RoundedRectangle(cornerRadius: 10, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
                    .fill(Color.blue)
                    .frame(width: 30, height: 30)
                    .overlay {
                        Image(systemName: "arrow.right")
                            .foregroundStyle(.white)
                        
                    }
            }
        }
        .padding(.horizontal)
    }
}

extension TopBar {
    func validateAndUpdateURL() {
        if inputString.isEmpty {
            inputString = ""
        } else if inputString.lowercased() == "test" {
            inputString = "https://eggthem17.github.io/wkwebkitsample/"
        } else if !inputString.lowercased().hasPrefix("http://") && !inputString.lowercased().hasPrefix("https://") {
            inputString = "https://" + inputString
        }
        inputURL = inputString
    }
}

//#Preview {
//    TopBar(urlString: "https://naver.com")
//}
