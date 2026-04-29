import SwiftUI

struct ClipboardRow: View {
    let item: ClipboardItem
    let isCopied: Bool
    let isSelected: Bool
    let onTap: () -> Void

    @State private var isHovering = false
    @State private var isPressed = false

    var body: some View {
        ZStack {

            RoundedRectangle(cornerRadius: 14)
                .fill(isSelected ? Color.blue.opacity(0.12) : Color(NSColor.windowBackgroundColor))
                .overlay(
                    RoundedRectangle(cornerRadius: 14)
                        .stroke(
                            isHovering ? Color.blue.opacity(0.4) : Color.gray.opacity(0.2),
                            lineWidth: 1
                        )
                )
                .shadow(
                    color: isHovering ? Color.black.opacity(0.12) : Color.black.opacity(0.05),
                    radius: isHovering ? 6 : 2,
                    x: 0,
                    y: 2
                )

            HStack {
                Text(item.text)
                    .lineLimit(3)
                    .truncationMode(.tail)

                Spacer()
            }
            .padding()
        }
        .frame(height: 72)

        .scaleEffect(isHovering ? 1.01 : 1.0)
        .onHover { hover in
            withAnimation(.easeInOut(duration: 0.15)) {
                isHovering = hover
            }
        }

        .scaleEffect(isPressed ? 0.97 : 1.0)
        .simultaneousGesture(
            TapGesture().onEnded { onTap() }
        )
        .simultaneousGesture(
            DragGesture(minimumDistance: 0)
                .onChanged { _ in
                    if !isPressed {
                        withAnimation(.easeIn(duration: 0.1)) {
                            isPressed = true
                        }
                    }
                }
                .onEnded { _ in
                    withAnimation(.spring(response: 0.25, dampingFraction: 0.6)) {
                        isPressed = false
                    }
                }
        )
        .contentShape(Rectangle())
    }
}
