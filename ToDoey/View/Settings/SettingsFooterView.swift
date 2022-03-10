//
//  SettingsFooterView.swift
//  ToDoey
//
//  Created by Tamás Nieszner on 2022. 02. 23..
//

import SwiftUI

struct SettingsFooterView: View {
    var body: some View {
        HStack {
            Spacer()
            
            Text("Copyright © 2022 Tamas Nieszner\nAll rights reserved.")
                .font(.system(size: 10))
                .multilineTextAlignment(.center)
                .foregroundColor(.secondary)
            
            Spacer()
        }
        .padding(.vertical, 8)
        .background(Color.backgroundColor).edgesIgnoringSafeArea(.all)
    }
}

struct SettingsFooterView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsFooterView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
