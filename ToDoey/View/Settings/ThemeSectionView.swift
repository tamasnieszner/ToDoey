//
//  ThemeSectionView.swift
//  ToDoey
//
//  Created by Tamás Nieszner on 2022. 03. 08..
//

import SwiftUI

struct ThemeSectionView: View {
    let themes: [Theme] = themeData
    @ObservedObject var themeSettings = ThemeSettings.shared
    
    @State private var isThemeChanged: Bool = false
    
    var body: some View {
        Section(header: Text("choose the app theme")) {
            List {
                ForEach(themes, id: \.id) { theme in
                    Button {
                        self.themeSettings.themeSettings = theme.id
                        UserDefaults.standard.set(self.themeSettings.themeSettings, forKey: "Theme")
                        self.isThemeChanged.toggle()
                    } label: {
                        HStack {
                            Image(systemName: "circle.fill")
                                .foregroundColor(theme.themeColor)
                            
                            Text(theme.themeName)
                                .font(.system(size: 14))
                                .foregroundColor(.emptyListColor)
                            
                            Spacer()
                            
                            if theme.id == themeSettings.themeSettings {
                                Image(systemName: "checkmark")
                                    .font(.system(size: 12))
                                    .foregroundColor(.emptyListColor)
                            }
                        }
                    }
                }
            }
        }
        .padding(.vertical, 3)
        .alert(isPresented: $isThemeChanged) {
            Alert(
                title: Text("success".uppercased()),
                message: Text("You have changed the theme to \(self.themes[themeSettings.themeSettings].themeName)"),
                dismissButton: .default(Text("OK"))
            )
        }
    }
}

struct ThemeSectionView_Previews: PreviewProvider {
    static var previews: some View {
        ThemeSectionView()
    }
}
