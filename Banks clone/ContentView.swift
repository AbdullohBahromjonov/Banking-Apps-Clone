//
//  ContentView.swift
//  Banks clone
//
//  Created by Abdulloh on 23/01/24.
//

import SwiftUI

struct ContentView: View {
    @State var text = ""
    @State var date = Date()
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.black
                    .ignoresSafeArea()
                
                List {
                    Section(header: Text("Sender")) {
                        TextField("Name", text: $text)
                        TextField("Card Number", text: $text)
                    }
                    
                    Section(header: Text("Reciver")) {
                        TextField("Name", text: $text)
                        TextField("Card Number", text: $text)
                    }
                    
                    Section(header: Text("Money")) {
                        TextField("Amount of money sent", text: $text)
                        TextField("Comission percent", text: $text)
                    }
                    
                    Section(header: Text("Date")) {
                        DatePicker("Sent Date", selection: $date, in: ...Date())
                    }
                    
                    Section(header: Text("Comment")) {
                        TextField("Comment...", text: $text)
                            .frame(height: 100, alignment: .top)
                    }
                }
                .scrollIndicators(.hidden)
            }
            .navigationTitle("Home")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

#Preview {
    ContentView()
}
