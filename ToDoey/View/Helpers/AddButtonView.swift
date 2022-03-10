//
//  AddButtonView.swift
//  ToDoey
//
//  Created by Tamás Nieszner on 2022. 02. 22..
//

import SwiftUI

struct AddButtonView: View {
    @State private var animating: Bool = false
    
    let themes: [Theme] = themeData
    @ObservedObject var themeSettings = ThemeSettings.shared
    
    var action: () -> Void
    
    var body: some View {
        ZStack {
            Circle()
                .fill(themes[themeSettings.themeSettings].themeColor)
                .opacity(0.5)
                .scaleEffect(animating ? 1 : 1.4)
                .frame(width: 48, height: 48)
                .animation(Animation.easeInOut(duration: 1.5).repeatForever(autoreverses: true), value: animating)
            
            Button {
                self.action()
            } label: {
                Image(systemName: "plus.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .background(Circle().fill(Color.baseColor))
                    .frame(width: 48, height: 48)
            }
            .accentColor(themes[themeSettings.themeSettings].themeColor)
            .onAppear {
                self.animating = true
            }
        }
    }
}

struct AddButtonView_Previews: PreviewProvider {
    static var previews: some View {
        AddButtonView {
            //
        }
        .previewLayout(.sizeThatFits)
        .padding()
    }
}
