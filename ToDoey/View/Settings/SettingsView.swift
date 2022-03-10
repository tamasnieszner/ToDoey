//
//  SettingsView.swift
//  ToDoey
//
//  Created by Tamás Nieszner on 2022. 02. 23..
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var iconSettings: IconSettings
    
    //theme
    let themes: [Theme] = themeData
    @ObservedObject var themeSettings = ThemeSettings.shared
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center, spacing: 0) {
                Form {
                    IconSectionView()
                    
                    ThemeSectionView()
                    
                    LinkSectionView()
                    
                    AboutSectionView()
                }
                .listStyle(GroupedListStyle())
                .environment(\.horizontalSizeClass, .regular)
                
                SettingsFooterView()
            }
            .navigationBarTitle("Settings", displayMode: .inline)
            .navigationBarItems(
                trailing: Button {
                    self.presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "xmark")
                }
            )
        }
        .accentColor(themes[themeSettings.themeSettings].themeColor)
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .environmentObject(IconSettings())
    }
}
