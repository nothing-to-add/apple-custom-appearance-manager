# CustomAppearanceManager

[![Swift](https://img.shields.io/badge/Swift-6.0-orange.svg)](https://swift.org)
[![Platform](https://img.shields.io/badge/Platforms-iOS%2013.0%20|%20macOS%2011.0%20|%20watchOS%207.0%20|%20visionOS%201.0-blue.svg)](https://developer.apple.com)
[![Swift Package Manager](https://img.shields.io/badge/Swift%20Package%20Manager-compatible-brightgreen.svg)](https://swift.org/package-manager/)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

A comprehensive appearance management solution for Apple platform applications that provides seamless dark/light mode switching with automatic system appearance detection and manual override capabilities.

## Features

- 🎨 **System Appearance Detection**: Automatically follows system-wide appearance changes
- 🌙 **Manual Dark/Light Mode**: Override system settings with custom appearance preferences
- 💾 **Persistent Settings**: Automatically saves and restores user preferences using UserDefaults
- 🔄 **SwiftUI Integration**: Native `@ObservableObject` support for reactive UI updates
- 📱 **Multi-Platform**: Support for iOS, macOS, watchOS, and visionOS
- ⚡ **Main Actor**: Thread-safe operations with `@MainActor` compliance
- 🎯 **Singleton Pattern**: Centralized appearance management across your app

## Requirements

- iOS 13.0+ / macOS 11.0+ / watchOS 7.0+ / visionOS 1.0+
- Swift 6.0+
- Xcode 15.0+

## Installation

### Swift Package Manager

#### Via Xcode

1. Open your project in Xcode
2. Go to **File** → **Add Package Dependencies...**
3. Enter the repository URL:
   ```
   https://github.com/nothing-to-add/apple-custom-appearance-manager.git
   ```
4. Click **Add Package**
5. Select the target where you want to use the package

#### Via Package.swift

Add the following dependency to your `Package.swift` file:

```swift
dependencies: [
    .package(url: "https://github.com/nothing-to-add/apple-custom-appearance-manager.git", from: "1.0.0")
]
```

Then add it to your target:

```swift
targets: [
    .target(
        name: "YourTarget",
        dependencies: [
            .product(name: "CustomAppearanceManager", package: "apple-custom-appearance-manager")
        ]
    )
]
```

## Usage

### Basic Setup

Import the package in your Swift files:

```swift
import CustomAppearanceManager
import SwiftUI
```

### SwiftUI Integration

Use the appearance manager in your SwiftUI views:

```swift
struct ContentView: View {
    @StateObject private var appearanceManager = AppearanceManager.shared
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("Current Mode: \(appearanceManager.appearanceModeDescription)")
                    .font(.headline)
                
                Toggle("Use System Appearance", isOn: $appearanceManager.useSystemAppearance)
                    .padding()
                
                if !appearanceManager.useSystemAppearance {
                    Toggle("Dark Mode", isOn: $appearanceManager.isDarkModeEnabled)
                        .padding()
                }
                
                Button("Reset to Defaults") {
                    appearanceManager.resetToDefaults()
                }
                .buttonStyle(.borderedProminent)
            }
            .padding()
            .navigationTitle("Appearance Settings")
        }
        .preferredColorScheme(appearanceManager.currentColorScheme)
    }
}
```

### UIKit Integration

For UIKit-based applications:

```swift
import UIKit
import CustomAppearanceManager

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Access the shared appearance manager
        let appearanceManager = AppearanceManager.shared
        
        // Check current appearance mode
        print("Current appearance: \(appearanceManager.appearanceModeDescription)")
        
        // Toggle system appearance
        appearanceManager.toggleSystemAppearance()
        
        // Manually set dark mode (only works when system appearance is disabled)
        if !appearanceManager.useSystemAppearance {
            appearanceManager.toggleDarkMode()
        }
    }
}
```

### Advanced Usage

#### Observing Appearance Changes

```swift
import Combine
import CustomAppearanceManager

class AppearanceObserver: ObservableObject {
    private let appearanceManager = AppearanceManager.shared
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        // Observe changes to system appearance setting
        appearanceManager.$useSystemAppearance
            .sink { useSystemAppearance in
                print("System appearance enabled: \(useSystemAppearance)")
            }
            .store(in: &cancellables)
        
        // Observe changes to dark mode setting
        appearanceManager.$isDarkModeEnabled
            .sink { isDarkMode in
                print("Dark mode enabled: \(isDarkMode)")
            }
            .store(in: &cancellables)
    }
}
```

#### Custom Appearance Logic

```swift
import CustomAppearanceManager

func setupCustomAppearance() {
    let manager = AppearanceManager.shared
    
    // Check if using system appearance
    if manager.useSystemAppearance {
        print("Following system appearance")
    } else {
        // Apply custom logic based on manual setting
        if manager.isDarkModeEnabled {
            print("Using custom dark mode")
        } else {
            print("Using custom light mode")
        }
    }
    
    // Get the effective color scheme for SwiftUI
    let colorScheme = manager.currentColorScheme
    
    // Get the effective interface style for UIKit
    let interfaceStyle = manager.effectiveColorScheme
}
```

## API Reference

### Properties

- `useSystemAppearance: Bool` - Whether to follow system appearance settings
- `isDarkModeEnabled: Bool` - Manual dark mode setting (only effective when system appearance is disabled)
- `currentColorScheme: ColorScheme` - Current color scheme for SwiftUI
- `effectiveColorScheme: UIUserInterfaceStyle` - Current interface style for UIKit
- `appearanceModeDescription: String` - Human-readable description of current appearance mode

### Methods

- `toggleSystemAppearance()` - Toggles the system appearance setting
- `toggleDarkMode()` - Toggles manual dark mode (only when system appearance is disabled)
- `resetToDefaults()` - Resets all settings to default values

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
