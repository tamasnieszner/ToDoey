//
//  ContentView.swift
//  ToDoey
//
//  Created by Tamás Nieszner on 2022. 02. 16..
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(
        entity: ToDoey.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \ToDoey.name, ascending: true)]
    )
    
    private var items: FetchedResults<ToDoey>
    
    @EnvironmentObject var iconSettings: IconSettings
    
    //navigation
    @State private var presentSettingsView: Bool = false
    @State private var presentAddItemView: Bool = false
    
    //theme
    let themes: [Theme] = themeData
    @ObservedObject var themeSettings = ThemeSettings.shared
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            NavigationView {
                ZStack {
                    List {
                        ForEach(self.items, id: \.self) { item in
                            HStack {
                                Circle()
                                    .frame(width: 12, height: 12)
                                    .foregroundColor(self.colorize(priority: item.priority ?? "Normal"))
                                
                                Text(item.name ?? "Unknown")
                                    .fontWeight(.semibold)
                                
                                Spacer()
                                
                                Text(item.priority ?? "Unknown")
                                    .font(.footnote)
                                    .foregroundColor(Color(UIColor.systemGray2))
                                    .padding(3)
                                    .frame(minWidth: 62)
                                    .overlay {
                                        Capsule().stroke(Color(UIColor.systemGray2), lineWidth: 0.75)
                                    }
                            }
                            .padding(.vertical, 10)
                        }
                        .onDelete(perform: deleteItems)
                    }
                    .navigationBarTitle("ToDoey", displayMode: .inline)
                    .navigationBarItems(
                        trailing:
                            Button {
                                self.presentSettingsView = true
                            } label: {
                                Image(systemName: "ellipsis")
                                    .imageScale(.large)
                            }
                            .accentColor(themes[themeSettings.themeSettings].themeColor)
                            .sheet(isPresented: $presentSettingsView) {
                                SettingsView().environmentObject(self.iconSettings)
                            }
                    )
                    
                    if items.count == 0 {
                        EmptyListView()
                    }
                }
                .if(items.count != 0) {
                    $0.navigationBarItems(
                        leading: EditButton().accentColor(themes[themeSettings.themeSettings].themeColor)
                    )
                }
            }
            
            AddButtonView {
                self.presentAddItemView = true
            }
            .padding(.bottom)
            .padding(.trailing, 20)
            .sheet(isPresented: $presentAddItemView) {
                AddItemView().environment(\.managedObjectContext, self.viewContext)
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)
            
            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    
    private func colorize(priority: String) -> Color {
        switch priority {
        case "High":
            return .mainRed
        case "Normal":
            return .mainGreen
        case "Low":
            return .mainBlue
        default:
            return .gray
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(IconSettings())
    }
}
