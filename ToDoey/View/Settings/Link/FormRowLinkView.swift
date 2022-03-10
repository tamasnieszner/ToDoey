//
//  FormRowLinkView.swift
//  ToDoey
//
//  Created by Tamás Nieszner on 2022. 02. 23..
//

import SwiftUI

struct FormRowLinkView: View {
    var icon: String
    var color: Color
    var text: String
    var link: String
    
    var body: some View {
        HStack {
            ZStack {
                RoundedRectangle(cornerRadius: 8, style: .continuous)
                    .fill(color)
                Image(icon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
            }
            .frame(width: 36, height: 36)
            
            Text(text)
                .font(.system(size: 14))
                .foregroundColor(.gray)
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .font(.system(size: 14, weight: .bold, design: .rounded))
                .foregroundColor(Color(.systemGray2))
        }
        .onTapGesture {
            self.openUrl()
        }
    }
    
    private func openUrl() {
        guard let url = URL(string: self.link), UIApplication.shared.canOpenURL(url) else { return }
        UIApplication.shared.open(url as URL)
    }
}

struct FormRowLinkView_Previews: PreviewProvider {
    static var previews: some View {
        FormRowLinkView(
            icon: "TwitterLogo",
            color: .pink,
            text: "Website",
            link: "https://tamasnieszner.io"
        )
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
