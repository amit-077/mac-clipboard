import Cocoa
import SwiftUI
import HotKey

class AppDelegate: NSObject, NSApplicationDelegate {
    var statusItem: NSStatusItem!
    var window: NSPanel!
    var hotKey: HotKey?
    let clipboardManager = ClipboardManager()

    func applicationDidFinishLaunching(_ notification: Notification) {
        // Menu bar icon
        statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)

        if let button = statusItem.button {
            let image = NSImage(
                systemSymbolName: "clipboard",
                accessibilityDescription: "Clipboard"
            )
            image?.isTemplate = true
            button.image = image
        }

        let menu = NSMenu()
        let openItem = NSMenuItem(
            title: "Open Clipboard",
            action: #selector(openApp),
            keyEquivalent: "v"
        )
        openItem.keyEquivalentModifierMask = [.command, .shift]
        menu.addItem(openItem)
        menu.addItem(NSMenuItem.separator())
        menu.addItem(
            NSMenuItem(
                title: "Quit",
                action: #selector(quitApp),
                keyEquivalent: "q"
            )
        )
        statusItem.menu = menu

        // Shortcut
        hotKey = HotKey(key: .v, modifiers: [.command, .shift])
        hotKey?.keyDownHandler = { [weak self] in
            self?.toggleWindow()
        }
    }

    @objc func openApp() {
        if window == nil {
            let contentView = ContentView(manager: clipboardManager)

            window = NSPanel(
                contentRect: NSRect(x: 0, y: 0, width: 320, height: 420),
                styleMask: [.titled, .closable],
                backing: .buffered,
                defer: false
            )
            
            window.title = "Clipboard"
            window.titleVisibility = .hidden
            window.titlebarAppearsTransparent = true
            window.backgroundColor = NSColor.windowBackgroundColor
            window.hasShadow = true
            window.level = .floating
//            window.collectionBehavior = [.transient, .ignoresCycle]
            window.isReleasedWhenClosed = false
            window.hidesOnDeactivate = true
            window.isFloatingPanel = true

            window.becomesKeyOnlyIfNeeded = true

            window.collectionBehavior = [
                .transient,
                .moveToActiveSpace
            ]

            // Position → TOP RIGHT
            if let screen = NSScreen.main {
                let frame = screen.visibleFrame
                let windowWidth: CGFloat = 340
                let windowHeight: CGFloat = 450

                let x = frame.minX + 20
                let y = frame.minY + 20

                window.setFrame(
                    NSRect(x: x, y: y, width: windowWidth, height: windowHeight),
                    display: true
                )
            }

            window.contentView = NSHostingView(rootView: contentView)

            // Auto close when focus lost
//            NotificationCenter.default.addObserver(
//                forName: NSWindow.didResignKeyNotification,
//                object: window,
//                queue: .main
//            ) { _ in
//                self.window.orderOut(nil)
//            }
        }

        NSApp.activate(ignoringOtherApps: true)
        window.makeKeyAndOrderFront(nil)
    }

    func toggleWindow() {
        if window != nil && window.isVisible {
            window.orderOut(nil)
        } else {
            openApp()
        }
    }

    @objc func quitApp() {
        NSApp.terminate(nil)
    }
}
