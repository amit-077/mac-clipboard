<img width="256" height="256" alt="final-1" src="https://github.com/user-attachments/assets/790d3dd5-7afb-49e1-816d-3c6b4b458efe" />

# Clippy - Clipboard Manager for macOS

A fast, lightweight, and keyboard-first clipboard manager for macOS — designed to bring a **Windows-style clipboard history (Win + V)** experience to Mac.<br>

Click [here](https://github.com/amit-077/mac-clipboard/releases/download/v1.0.0/Clippy.zip) to download Clippy.

---

## 🚀 Overview

macOS does not provide a built-in clipboard history. This app fills that gap by keeping track of your recent copies and letting you access them instantly with a global shortcut.

It’s built to be:

* ⚡ Fast
* 🧠 Minimal
* ⌨️ Keyboard-driven
* 🍎 Native-feeling

---

## ✨ Features

### 📚 Clipboard History

* Stores the last **20 copied items**
* Automatically updates in real-time
* Avoids duplicate consecutive entries

---

### ⌨️ Global Shortcut

* Open instantly with:
  **`Cmd + Shift + V`**
* Works system-wide (any app)

---

### 🔍 Search

* Type to filter clipboard items instantly
* Case-insensitive matching
* Designed for speed and simplicity

---

### 🧭 Keyboard Navigation

* ↑ / ↓ → Navigate through items
* Enter → Copy selected item
* Fully usable without a mouse

---

### 🖱️ Mouse Interaction

* Click any item → copied instantly
* Visual feedback for actions

---

### 🪟 Native Floating Panel

* Opens as a lightweight floating window
* Appears at screen corner
* Closes automatically when clicking outside

---

### 🚫 Smart Handling

* Prevents duplicate spam
* Ignores self-triggered copies
* Efficient memory usage

---

## 🎯 How It Works

1. Copy something (`Cmd + C`)
2. Press **Cmd + Shift + V**
3. Browse or search your clipboard history
4. Press **Enter** or click → item is copied again

---

## 📦 Installation

### Option 1 — Download Prebuilt App

1. Go to the **Releases** section of this repository
2. Download: `ClipboardManager.zip`
3. Extract the file
4. Drag `ClipboardManager.app` into **Applications**

---

### ⚠️ macOS Security Notice

Since the app is not code-signed, macOS may block it initially.

To run it:

* Right-click → **Open**
* OR go to:

  * **System Settings → Privacy & Security**
  * Click **“Allow Anyway”**

---

## 🛠️ Built With

* **Swift**
* **SwiftUI**
* **AppKit**
* **HotKey** (for global keyboard shortcuts)

---

## 🧠 Design Philosophy

This app is intentionally:

* Minimal (no unnecessary features)
* Fast (instant response)
* Focused (clipboard only, no bloat)

Inspired by tools like:

* Windows Clipboard (Win + V)
* Raycast
* Alfred

---

## 📸 Screenshot (Optional)

> Add a screenshot here to improve repo quality

Example:

```
![App Screenshot](screenshot.png)
```

---

## 🧪 Current Limitations

* Stores only text (no images/files yet)
* History resets after app restart
* Not code-signed (manual permission needed)

---

## 🧭 Roadmap / Future Improvements

Planned enhancements:

* 📌 Pin important clipboard items
* 💾 Persistent history (save across restarts)
* 🚀 Launch at login option
* 🎨 UI polish & animations
* 🔐 Code signing + notarization
* 📂 Support for images & rich content
* ⌨️ Full keyboard-only workflow

---

## 🤝 Contributing

Contributions are welcome!

You can:

* Open issues for bugs or suggestions
* Submit pull requests
* Suggest improvements

---

## 📄 License

MIT License

---

## 🙌 Final Note

This project started as a simple utility but aims to become a **clean, reliable clipboard experience for macOS users**.

If you find it useful, consider starring the repo ⭐
