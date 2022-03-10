//
//  ThemeSettings.swift
//  ToDoey
//
//  Created by Tamás Nieszner on 2022. 03. 07..
//

import SwiftUI

final public class ThemeSettings: ObservableObject {
    @Published public var themeSettings: Int = UserDefaults.standard.integer(forKey: "Theme") {
        didSet {
            UserDefaults.standard.set(self.themeSettings, forKey: "Theme")
        }
    }
    
    private init() { }
    public static let shared = ThemeSettings()
}
