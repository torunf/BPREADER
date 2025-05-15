//
//  BCBPParser.swift
//  pdf417scanner
//
//  Created by Furkan Torun on 14.05.2025.
//

import Foundation

struct BCBPField: Identifiable {
    let id = UUID()
    let label: String
    let value: String
}

struct BCBPParser {
    static func parse(from raw: String) -> [BCBPField] {
        let trimmed = raw.replacingOccurrences(of: "\n", with: "").trimmingCharacters(in: .whitespaces)
        guard trimmed.count >= 60 else { return [BCBPField(label: "Raw", value: raw)] }

        let fields: [BCBPField] = [
            .init(label: "Format Code", value: String(trimmed[0])),
            .init(label: "Number of Legs", value: String(trimmed[1])),
            .init(label: "Passenger Name", value: String(trimmed[2..<22]).trimmingCharacters(in: .whitespaces)),
            .init(label: "PNR Code", value: String(trimmed[23..<30]).trimmingCharacters(in: .whitespaces)),
            .init(label: "From Airport", value: String(trimmed[30..<33])),
            .init(label: "To Airport", value: String(trimmed[33..<36])),
            .init(label: "Operating Carrier", value: String(trimmed[36..<39])),
            .init(label: "Flight Number", value: String(trimmed[39..<43])),
            .init(label: "Julian Date", value: String(trimmed[44..<47])),
            .init(label: "Compartment Code", value: String(trimmed[47])),
            .init(label: "Seat Number", value: String(trimmed[48..<52])),
            .init(label: "Check-in Sequence", value: String(trimmed[52..<57])),
            .init(label: "Passenger Status", value: String(trimmed[57]))
        ]

        return fields
    }
}

// Extension for substring indexing
extension String {
    subscript(_ range: Range<Int>) -> Substring {
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end = index(startIndex, offsetBy: range.upperBound)
        return self[start..<end]
    }

    subscript(_ index: Int) -> Character {
        self[self.index(startIndex, offsetBy: index)]
    }
}
