//
//  ContentView.swift
//  pdf417scanner
//
//  Created by Furkan Torun on 14.05.2025.
//

import SwiftUI

struct ContentView: View {
    
    @State private var scannedCode: String?
    @State private var parsedFields: [BCBPField] = []
    @State private var isShowingScanner = false

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                if let _ = scannedCode {
                    NavigationLink("📄 Tarama Detayını Gör", destination: ScannedDetailView(parsedFields: parsedFields))
                        .font(.title2)
                        .padding()
                } else {
                    Text("Henüz bir barkod taranmadı.")
                        .foregroundColor(.secondary)
                }

                Button("📷 Barkod Tara") {
                    isShowingScanner = true
                }
                .font(.title2)
                .padding()
            }
            .sheet(isPresented: $isShowingScanner) {
                ScannerView { scanned in
                    scannedCode = scanned
                    parsedFields = BCBPParser.parse(from: scanned)
                    isShowingScanner = false
                }
            }
            .navigationTitle("PDF417 Scanner")
            .padding()
        }
    }
    
}

#Preview {
    ContentView()
}

