//
//  LinkSectionView.swift
//  ToDoey
//
//  Created by Tamás Nieszner on 2022. 02. 23..
//

import SwiftUI

struct LinkSectionView: View {
    var body: some View {
        Section(header: Text("social media")) {
            FormRowLinkView(
                icon: "WebsiteLogo",
                color: .pink,
                text: "Website",
                link: "https://tamasnieszner.io"
            )
            
            FormRowLinkView(
                icon: "TwitterLogo",
                color: .twitter,
                text: "Twitter",
                link: "https://twitter.com/telcsifiju"
            )
            
            FormRowLinkView(
                icon: "GithubLogo",
                color: .green,
                text: "GitHub",
                link: "https://github.com/tamasnieszner"
            )
        }
        .padding(.vertical, 3)
    }
}

struct LinkSectionView_Previews: PreviewProvider {
    static var previews: some View {
        LinkSectionView()
    }
}
