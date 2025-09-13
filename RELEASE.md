# Release Notes - CustomAppearanceManager v1.0.0

**Release Date:** September 14, 2025

## 🎉 Initial Release

We're excited to announce the first stable release of **CustomAppearanceManager** - a comprehensive appearance management solution for Apple platform applications!

## ✨ What's New

### Core Features
- **System Appearance Detection**: Automatically follows system-wide dark/light mode changes
- **Manual Override**: Take control with custom appearance preferences that override system settings
- **Persistent Storage**: Your users' preferences are automatically saved and restored using UserDefaults
- **SwiftUI Ready**: Native `@ObservableObject` support for seamless reactive UI updates
- **Multi-Platform**: Works across iOS, macOS, watchOS, and visionOS
- **Thread Safe**: Built with `@MainActor` compliance for safe UI operations
- **Centralized Management**: Singleton pattern ensures consistent appearance across your entire app

### Platform Support
- 📱 **iOS** 13.0+
- 💻 **macOS** 11.0+
- ⌚ **watchOS** 7.0+
- 🥽 **visionOS** 1.0+

### Developer Experience
- **Swift 6.0** compatibility
- **Swift Package Manager** integration
- **Comprehensive Documentation** with SwiftUI and UIKit examples
- **Simple API** with intuitive method names
- **Zero Dependencies** - lightweight and fast

## 🚀 Getting Started

### Installation via Swift Package Manager

Add to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/nothing-to-add/apple-custom-appearance-manager.git", from: "1.0.0")
]
```

### Quick Usage Example

```swift
import CustomAppearanceManager
import SwiftUI

struct ContentView: View {
    @StateObject private var appearanceManager = AppearanceManager.shared
    
    var body: some View {
        VStack {
            Text("Current Mode: \(appearanceManager.appearanceModeDescription)")
            Toggle("Use System Appearance", isOn: $appearanceManager.useSystemAppearance)
        }
        .preferredColorScheme(appearanceManager.currentColorScheme)
    }
}
```

## 📚 Key API Highlights

### Properties
- `useSystemAppearance: Bool` - Follow system appearance
- `isDarkModeEnabled: Bool` - Manual dark mode control
- `currentColorScheme: ColorScheme` - SwiftUI color scheme
- `effectiveColorScheme: UIUserInterfaceStyle` - UIKit interface style

### Methods
- `toggleSystemAppearance()` - Toggle system appearance following
- `toggleDarkMode()` - Toggle manual dark mode
- `resetToDefaults()` - Reset all settings

## 🔧 Technical Details

- **Minimum Requirements**: Swift 6.0, Xcode 15.0+
- **Architecture**: Singleton pattern with `@MainActor` compliance
- **Storage**: UserDefaults for preference persistence
- **Integration**: SwiftUI `@ObservableObject` and UIKit compatibility
- **License**: MIT License

## 📖 Documentation

Complete documentation is available in the README.md file, including:
- Detailed installation instructions
- SwiftUI integration examples
- UIKit usage patterns
- Advanced usage scenarios
- API reference

## 🤝 Contributing

We welcome contributions! Please feel free to submit issues and pull requests on our [GitHub repository](https://github.com/nothing-to-add/apple-custom-appearance-manager).

## 📄 License

This project is licensed under the MIT License. See the LICENSE file for details.

---

**Download:** [v1.0.0](https://github.com/nothing-to-add/apple-custom-appearance-manager/archive/v1.0.0.zip)  
**Repository:** [github.com/nothing-to-add/apple-custom-appearance-manager](https://github.com/nothing-to-add/apple-custom-appearance-manager)
