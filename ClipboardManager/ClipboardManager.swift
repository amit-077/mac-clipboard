import AppKit
import SwiftUI

struct ClipboardItem: Identifiable {
    let id = UUID()
    let text: String
}

class ClipboardManager: ObservableObject {
    private let pasteboard = NSPasteboard.general
    private var lastChangeCount: Int
    private var lastCopiedByApp: String?

    @Published var history: [ClipboardItem] = []

    init() {
        lastChangeCount = pasteboard.changeCount

        Timer.scheduledTimer(withTimeInterval: 0.8, repeats: true) { _ in
            self.checkClipboard()
        }
    }

    private func checkClipboard() {
        if pasteboard.changeCount != lastChangeCount {
            lastChangeCount = pasteboard.changeCount

            if let text = pasteboard.string(forType: .string) {
                if text == lastCopiedByApp { return }
                addToHistory(text)
            }
        }
    }

    private func addToHistory(_ text: String) {
        if history.first?.text == text { return }

        history.insert(ClipboardItem(text: text), at: 0)

        if history.count > 20 {
            history.removeLast()
        }
    }

    func copyFromApp(_ text: String) {
        let pb = NSPasteboard.general
        pb.clearContents()
        pb.setString(text, forType: .string)
        lastCopiedByApp = text
    }
}
