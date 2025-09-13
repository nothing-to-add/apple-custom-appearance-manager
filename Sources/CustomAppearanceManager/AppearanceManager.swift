//
//  File name: AppearanceManager.swift
//  Project name: apple-custom-appearance-manager
//  Workspace name: apple-custom-appearance-manager
//
//  Created by: nothing-to-add on 14/09/2025
//  Using Swift 6.0
//  Copyright (c) 2023 nothing-to-add
//

import Foundation
import SwiftUI
import UIKit

@MainActor
public class AppearanceManager: ObservableObject {
    public static let shared = AppearanceManager()
    
    // MARK: - UserDefaults Keys
    private enum UserDefaultsKeys {
        static let useSystemAppearance = "useSystemAppearance"
        static let isDarkModeEnabled = "isDarkModeEnabled"
    }
    
    // MARK: - Properties
    @Published public var useSystemAppearance: Bool {
        didSet {
            UserDefaults.standard.set(useSystemAppearance, forKey: UserDefaultsKeys.useSystemAppearance)
            applyAppearance()
        }
    }
    
    @Published public var isDarkModeEnabled: Bool {
        didSet {
            UserDefaults.standard.set(isDarkModeEnabled, forKey: UserDefaultsKeys.isDarkModeEnabled)
            if !useSystemAppearance {
                applyAppearance()
            }
        }
    }
    
    // MARK: - Computed Properties
    public var currentColorScheme: ColorScheme {
        if useSystemAppearance {
            // Return system color scheme
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
                return windowScene.traitCollection.userInterfaceStyle == .dark ? .dark : .light
            }
            return .light
        } else {
            return isDarkModeEnabled ? .dark : .light
        }
    }
    
    public var effectiveColorScheme: UIUserInterfaceStyle {
        if useSystemAppearance {
            return .unspecified // Let system decide
        } else {
            return isDarkModeEnabled ? .dark : .light
        }
    }
    
    // MARK: - Initialization
    private init() {
        // Load saved preferences or use defaults
        self.useSystemAppearance = UserDefaults.standard.object(forKey: UserDefaultsKeys.useSystemAppearance) as? Bool ?? true
        self.isDarkModeEnabled = UserDefaults.standard.object(forKey: UserDefaultsKeys.isDarkModeEnabled) as? Bool ?? false
        
        // Apply the saved appearance
        applyAppearance()
    }
    
    // MARK: - Public Methods
    
    /// Toggles the system appearance setting
    public func toggleSystemAppearance() {
        useSystemAppearance.toggle()
    }
    
    /// Toggles the manual dark mode setting (only works when system appearance is disabled)
    public func toggleDarkMode() {
        guard !useSystemAppearance else { return }
        isDarkModeEnabled.toggle()
    }
    
    /// Applies the current appearance settings to all windows
    private func applyAppearance() {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return
        }
        
        for window in windowScene.windows {
            window.overrideUserInterfaceStyle = effectiveColorScheme
        }
    }
    
    /// Resets appearance settings to defaults
    public func resetToDefaults() {
        useSystemAppearance = true
        isDarkModeEnabled = false
    }
    
    /// Gets a string representation of the current appearance mode for display
    public var appearanceModeDescription: String {
        if useSystemAppearance {
            return "System"
        } else {
            return isDarkModeEnabled ? "Dark" : "Light"
        }
    }
}

