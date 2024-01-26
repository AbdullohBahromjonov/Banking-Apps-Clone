//
//  ContentView.swift
//  Banks clone
//
//  Created by Abdulloh on 23/01/24.
//

import SwiftUI

struct ContentView: View {
    @State var senderName = ""
    @State var senderCard = ""
    @State var reciverName = ""
    @State var reciverCard = ""
    @State var money = ""
    @State var percent = ""
    @State var comment = ""
    
    @State var date = Date()
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.black
                    .ignoresSafeArea()
                
                List {
                    Section(header: Text("Sender")) {
                        TextField("Name", text: $senderName)
                        TextField("Card Number", text: $senderCard)
                    }
                    
                    Section(header: Text("Reciver")) {
                        TextField("Name", text: $reciverName)
                        TextField("Card Number", text: $reciverCard)
                    }
                    
                    Section(header: Text("Money")) {
                        TextField("Amount of money sent", text: $money)
                        TextField("Comission percent", text: $percent)
                    }
                    
                    Section(header: Text("Date")) {
                        DatePicker("Sent Date", selection: $date, in: ...Date())
                    }
                    
                    Section(header: Text("Comment")) {
                        TextField("Comment...", text: $comment)
                            .frame(height: 100, alignment: .top)
                    }
                    
                    
                    NavigationLink(value: money) {
                        Text("Next")
                            .foregroundStyle(.blue)
                    }
                }
                .scrollIndicators(.hidden)
            }
            .navigationTitle("Home")
            .navigationBarTitleDisplayMode(.large)
            .navigationDestination(for: String.self) { value in
                UzumBankSimpleCheck(
                    money: value,
                    senderName: senderName,
                    sender: senderCard,
                    reciverName: reciverName,
                    reciver: reciverCard,
                    comission: percent,
                    date: date
                )
            }
        }
    }
}

#Preview {
    ContentView()
}
