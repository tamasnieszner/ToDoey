//
//  FormRowAboutView.swift
//  ToDoey
//
//  Created by Tamás Nieszner on 2022. 02. 23..
//

import SwiftUI

struct FormRowAboutView: View {
    var icon: String
    var title: String
    var text: String
    
    var body: some View {
            HStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 8, style: .continuous)
                        .fill(Color.gray)
                    Image(systemName: icon)
                        .foregroundColor(.white)
                }
                .frame(width: 36, height: 36)
                
                Text(title)
                    .foregroundColor(.gray)
                    .font(.system(size: 14))
                
                Spacer()
                
                Text(text)
                    .foregroundColor(.emptyListColor)
                    .font(.system(size: 14))
            }
    }
}

struct FormRowStaticView_Previews: PreviewProvider {
    static var previews: some View {
        FormRowAboutView(
            icon: "gear",
            title: "Application",
            text: "ToDoey"
        )
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
