//
//  ScannedDetailView.swift
//  pdf417scanner
//
//  Created by Furkan Torun on 14.05.2025.
//

import SwiftUI

struct ScannedDetailView: View {
    let parsedFields: [BCBPField]

    var body: some View {
        List(parsedFields) { field in
            VStack(alignment: .leading, spacing: 4) {
                Text(field.label)
                    .font(.caption)
                    .foregroundColor(.gray)
                Text(field.value)
                    .font(.body)
                    .monospaced()
            }
            .padding(.vertical, 4)
        }
        .navigationTitle("Tarama Detayı")
    }
}
