//
//  AboutSectionView.swift
//  ToDoey
//
//  Created by Tamás Nieszner on 2022. 02. 23..
//

import SwiftUI

struct AboutSectionView: View {
    var body: some View {
        Section(header: Text("about")) {
            FormRowAboutView(
                icon: "info.circle.fill",
                title: "Application",
                text: "ToDoey"
            )
            
            FormRowAboutView(
                icon: "iphone",
                title: "Compatibility",
                text: "iPhone, iPad"
            )
            
            FormRowAboutView(
                icon: "keyboard",
                title: "Developer",
                text: "Tamas Nieszner"
            )
            
            FormRowAboutView(
                icon: "paintbrush.pointed",
                title: "Designer",
                text: "Robert Petras"
            )
            
            FormRowAboutView(
                icon: "flag",
                title: "Version",
                text: "1.0.0"
            )
        }
        .padding(.vertical, 3)
    }
}

struct AboutSectionView_Previews: PreviewProvider {
    static var previews: some View {
        AboutSectionView()
    }
}
