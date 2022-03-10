//
//  AddItemView.swift
//  ToDoey
//
//  Created by Tamás Nieszner on 2022. 02. 16..
//

import SwiftUI
import CoreData

struct AddItemView: View {
    @Environment(\.managedObjectContext) var viewContext
    @Environment(\.presentationMode) var presentationMode
    
    //theme
    let themes: [Theme] = themeData
    @ObservedObject var themeSettings = ThemeSettings.shared
    
    //list
    @State private var name: String = ""
    @State private var priority: String = "Normal"
    
    //popup
    @State private var showError: Bool = false
    @State private var errorTitle: String = ""
    @State private var errorMessage: String = ""
    
    let priorities = ["High", "Normal", "Low"]
    
    var body: some View {
        NavigationView {
            VStack {
                VStack(alignment: .leading, spacing: 25) {
                    TextField("New Item..", text: $name)
                        .padding(10)
                        .background(Color.init(uiColor: .tertiarySystemFill))
                        .cornerRadius(8)
                        .font(.system(size: 20, weight: .medium, design: .rounded))
                    
                    Picker("Priority", selection: $priority) {
                        ForEach(priorities, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    
                    Button {
                        self.formValidation()
                    } label: {
                        Text("Save")
                            .font(.system(size: 20, weight: .bold, design: .rounded))
                            .padding(10)
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .background(themes[themeSettings.themeSettings].themeColor)
                            .cornerRadius(8)
                            .foregroundColor(.white)
                    }
                }
                .padding(.horizontal)
                .padding(.vertical, 20)
                
                Spacer()
            }
            .background(Color.backgroundColor)
            .navigationBarTitle("New Item", displayMode: .inline)
            .navigationBarItems(
                trailing:
                    Button {
                        self.presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "xmark")
                    }
            )
            .alert(isPresented: $showError) {
                Alert(
                    title: Text(errorTitle),
                    message: Text(errorMessage),
                    dismissButton: .default(Text("OK"))
                )
            }
            .accentColor(themes[themeSettings.themeSettings].themeColor)
            .navigationViewStyle(StackNavigationViewStyle())
        }
    }
    
    private func addItem() {
        withAnimation {
            let newItem = ToDoey(context: viewContext)
            newItem.name = self.name
            newItem.priority = self.priority
            newItem.timestamp = itemFormatter.defaultDate
            
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
    
    private func formValidation() {
        if !self.name.isEmpty {
            self.addItem()
        } else {
            self.showError = true
            self.errorTitle = "Missing item name"
            self.errorMessage = "Make sure to enter a name\nfor the new item."
            return
        }
        
        self.presentationMode.wrappedValue.dismiss()
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct AddItemView_Previews: PreviewProvider {
    static var previews: some View {
        AddItemView()
    }
}
