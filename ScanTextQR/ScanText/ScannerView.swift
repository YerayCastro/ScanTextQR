//
//  ScannerView.swift
//  ScanTextQR
//
//  Created by Yery Castro on 2/3/23.
//

import SwiftUI

struct ScannerView: View {
    
    @State private var showScanner = false
    @State private var texts : [ScanData] = []
    
    func makeScanner() -> Scanner {
        Scanner(completion: { textPage in
            if let outputText = textPage?.joined(separator: "\n").trimmingCharacters(in: .whitespacesAndNewlines) {
                let newScanData = ScanData(content: outputText)
                texts.append(newScanData)
            }
            showScanner = false
        })
    }
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center){
                if texts.count > 0 {
                    List{
                        ForEach(texts){ text in
                            NavigationLink(destination: ScrollView{
                                Text(text.content)
                                    .multilineTextAlignment(.leading)
                                    .padding()
                            },
                                           label: {
                                Text(text.content).lineLimit(1)
                            })
                        }
                    }
                    
                }else{
                    Text("no hay nada escaneado")
                }
            }.navigationTitle("Escanear documento")
                .toolbar{
                    Button {
                        showScanner = true
                    } label: {
                        Image(systemName: "doc.text.viewfinder")
                    }.sheet(isPresented: $showScanner) {
                        makeScanner()
                    }

                }
        }
    }
}


