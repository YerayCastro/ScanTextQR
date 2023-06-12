//
//  ContentView.swift
//  ScanTextQR
//
//  Created by Yery Castro on 2/3/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            ScannerView().tabItem {
                Label("Scan Text", systemImage: "doc.text.viewfinder")
            }
            QRView().tabItem {
                Label("QR Code", systemImage: "qrcode.viewfinder")
            }
        }
    }
}


