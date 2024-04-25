//
//  StringExtension.swift
//  Deque
//
//  Created by Adrian Eves on 4/25/24.
//

import Foundation

extension String {
    func displayHtml() -> String {
        do {
            return try NSAttributedString(
                data: self.data(using: .utf8)!,
                options: [.documentType: NSAttributedString.DocumentType.html],
                documentAttributes: nil).string
        } catch {
            return error.localizedDescription
        }
    }
}
