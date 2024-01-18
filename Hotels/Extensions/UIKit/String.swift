//
//  String.swift
//  Hotels
//
//  Created by mac on 10.01.2024.
//

import UIKit

extension String {
    func chunked(by size: Int) -> [String] {
        return stride(from: 0, to: count, by: size).map {
            let start = index(startIndex, offsetBy: $0)
            let end = index(start, offsetBy: size, limitedBy: endIndex) ?? endIndex
            return String(self[start..<end])
        }
    }
}
