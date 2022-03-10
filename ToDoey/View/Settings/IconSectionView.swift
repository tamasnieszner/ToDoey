//
//  IconSectionView.swift
//  ToDoey
//
//  Created by Tamás Nieszner on 2022. 02. 25..
//

import SwiftUI

struct IconSectionView: View {
    @EnvironmentObject var iconSettings: IconSettings
    
    var body: some View {
        Section(header: Text("choose the app icon")) {
            Picker(
                selection: $iconSettings.currentIndex,
                label:
                    HStack {
                        ZStack {
                            RoundedRectangle(cornerRadius: 8)
                                .strokeBorder(Color.emptyListColor, lineWidth: 2)
                            
                            Image(systemName: "paintbrush")
                                .font(.system(size: 28, weight: .regular, design: .default))
                                .foregroundColor(.emptyListColor)
                        }
                        .frame(width: 44, height: 44)
                        
                        Text("Color".uppercased())
                            .foregroundColor(.emptyListColor)
                            .font(.system(size: 14))
                            .fontWeight(.semibold)
                    }) {
                    
                    ForEach(0..<iconSettings.iconNames.count) { index in
                        HStack {
                            Image(uiImage: UIImage(named: self.iconSettings.iconNames[index] ?? "Blue") ?? UIImage())
                                .renderingMode(.original)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 44, height: 44)
                                .cornerRadius(8)
                            
                            Spacer().frame(width: 8)
                            
                            Text(self.iconSettings.iconNames[index] ?? "Blue")
                                .font(.system(size: 14))
                                .frame(alignment: .leading)
                        }
                        .padding(3)
                    }
                }
                .onReceive([self.iconSettings.currentIndex].publisher.first()) { value in
                    let index = self.iconSettings.iconNames.firstIndex(of: UIApplication.shared.alternateIconName) ?? 0
                    if index != value {
                        UIApplication.shared.setAlternateIconName(self.iconSettings.iconNames[value]) { error in
                            if let error = error {
                                fatalError("Unresolved error \(error), \(error.localizedDescription)")
                            } else {
                                print("Success")
                            }
                        }
                    }
                }
        }
    }
}

struct PickerSectionView_Previews: PreviewProvider {
    static var previews: some View {
        IconSectionView()
            .environmentObject(IconSettings())
    }
}
