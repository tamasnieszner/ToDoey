//
//  EmptyListView.swift
//  ToDoey
//
//  Created by Tamás Nieszner on 2022. 02. 22..
//

import SwiftUI

struct EmptyListView: View {
    let images: [String] = [
        "illustration-no1",
        "illustration-no2",
        "illustration-no3"
    ]
    
    let tips: [String] = [
        "Use your time wisely.",
        "Slow and steady wins the race.",
        "Keep it short and sweet.",
        "Put hard tasks first.",
        "Reward yourself after work.",
        "Collect tasks ahead of time.",
        "Each night schedule for tomorrow."
    ]
    
    var body: some View {
        ZStack {
            VStack(alignment: .center, spacing: 40) {
                Image(images.randomElement() ?? images[0])
                    .resizable()
                    .scaledToFit()
                    .frame(
                        minWidth: 256,
                        idealWidth: 280,
                        maxWidth: 360,
                        minHeight: 256,
                        idealHeight: 280,
                        maxHeight: 360,
                        alignment: .center
                    )
                    .layoutPriority(1)
                
                Text(tips.randomElement() ?? tips[0])
                    .layoutPriority(0.5)
                    .font(.system(.headline, design: .rounded))
                    .foregroundColor(.emptyListColor)
            }
            .padding(.horizontal)
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(Color.baseColor)
        .edgesIgnoringSafeArea(.all)
    }
}

struct EmptyListView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyListView()
    }
}
