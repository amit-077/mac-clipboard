import SwiftUI

struct ContentView: View {
    @ObservedObject var manager: ClipboardManager

    @State private var copiedItemID: UUID?
    @State private var searchText: String = ""
    @State private var selectedIndex: Int = 0
    @State private var showCopiedMessage = false

    var filteredItems: [ClipboardItem] {
        if searchText.isEmpty {
            return manager.history
        } else {
            return manager.history.filter {
                $0.text.localizedCaseInsensitiveContains(searchText)
            }
        }
    }

    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            
            VStack(spacing: 8) {

                // 🔍 Search
                TextField("Search clipboard...", text: $searchText)
                    .textFieldStyle(.roundedBorder)
                    .padding([.horizontal, .top])

                ScrollView {
                    VStack(spacing: 10) {
                        ForEach(Array(filteredItems.enumerated()), id: \.element.id) { index, item in
                            ClipboardRow(
                                item: item,
                                isCopied: copiedItemID == item.id,
                                isSelected: selectedIndex == index,
                                onTap: {
                                    handleCopy(item)
                                }
                            )
                        }
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 8)
                }
            }
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color(NSColor.windowBackgroundColor))
                    .shadow(color: .black.opacity(0.15), radius: 10, x: 0, y: 4)
            )
            .padding(6)

            // Toast
            if showCopiedMessage {
                Text("Copied")
                    .font(.caption.weight(.semibold))
                    .padding(.horizontal, 12)
                    .padding(.vertical, 6)
                    .background(Color.black.opacity(0.8))
                    .foregroundColor(.white)
                    .cornerRadius(8)
                    .padding(12)
                    .transition(.opacity)
            }
        }
        .frame(width: 340, height: 450)
    }
    // Keyboard navigation
    func handleKey(_ event: NSEvent) {
        guard !filteredItems.isEmpty else { return }

        switch event.keyCode {
        case 125: // down
            selectedIndex = min(selectedIndex + 1, filteredItems.count - 1)

        case 126: // up
            selectedIndex = max(selectedIndex - 1, 0)

        case 36: // enter
            handleCopy(filteredItems[selectedIndex])

        default:
            break
        }
    }

    func handleCopy(_ item: ClipboardItem) {
        manager.copyFromApp(item.text)

        withAnimation {
            copiedItemID = item.id
            showCopiedMessage = true
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
            withAnimation {
                copiedItemID = nil
                showCopiedMessage = false
            }
        }
    }
}
