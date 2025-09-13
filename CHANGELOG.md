# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.0.0] - 2025-09-14

### Added
- Initial release of CustomAppearanceManager
- Comprehensive appearance management solution for Apple platform applications
- System appearance detection with automatic following of system-wide appearance changes
- Manual dark/light mode override capabilities
- Persistent settings using UserDefaults for saving and restoring user preferences
- SwiftUI integration with native `@ObservableObject` support for reactive UI updates
- Multi-platform support for iOS 13.0+, macOS 11.0+, watchOS 7.0+, and visionOS 1.0+
- Thread-safe operations with `@MainActor` compliance
- Singleton pattern for centralized appearance management
- Swift Package Manager support
- Comprehensive API with:
  - `useSystemAppearance` property for system appearance toggle
  - `isDarkModeEnabled` property for manual dark mode control
  - `currentColorScheme` computed property for SwiftUI integration
  - `effectiveColorScheme` computed property for UIKit integration
  - `appearanceModeDescription` for human-readable appearance status
  - `toggleSystemAppearance()` method
  - `toggleDarkMode()` method
  - `resetToDefaults()` method
- Complete documentation with usage examples for both SwiftUI and UIKit
- MIT License

### Features
- 🎨 System appearance detection
- 🌙 Manual dark/light mode override
- 💾 Persistent user preferences
- 🔄 SwiftUI reactive integration
- 📱 Multi-platform compatibility
- ⚡ Main actor thread safety
- 🎯 Centralized singleton management

### Requirements
- Swift 6.0+
- Xcode 15.0+
- iOS 13.0+ / macOS 11.0+ / watchOS 7.0+ / visionOS 1.0+

[1.0.0]: https://github.com/nothing-to-add/apple-custom-appearance-manager/releases/tag/1.0.0
