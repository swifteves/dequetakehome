//
//  StringExtension.swift
//  Deque
//
//  Created by Adrian Eves on 4/25/24.
//

import Foundation

// Taken from: https://forums.developer.apple.com/forums/thread/677823
extension String {
    func htmlToString() -> String {
        try! NSAttributedString(data: self.data(using: .utf8)!,
                                        options: [.documentType: NSAttributedString.DocumentType.html],
                                        documentAttributes: nil).string
    }
}
