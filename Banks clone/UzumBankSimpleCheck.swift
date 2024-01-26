//
//  UzumBankSimpleCheck.swift
//  Banks clone
//
//  Created by Abdulloh on 23/01/24.
//

import SwiftUI

struct UzumBankSimpleCheck: View {
    @Environment(\.dismiss) var dismiss
    let money: String
    let senderName: String
    let sender: String
    let reciverName: String
    let reciver: String
    let comission: String
    let date: Date
    
    @State var onOff = false
    @State var showDetails = false
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            VStack {
                VStack(spacing: 10) {
                    Image("Phone")
                    
                    Text("\(money) сум")
                        .font(.system(size: 30, weight: .medium))
                    
                    Text("Успешно")
                        .font(.system(size: 18, weight: .medium))
                        .padding(.bottom)
                    
                    VStack(spacing: 17) {
                        HStack {
                            Image("Menu icon")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 30)
                                .padding(.trailing, 7)
                            
                            Text("Подробней")
                                .font(.system(size: 20, weight: .medium))
                            
                            Spacer()
                            
                            Image(systemName: "chevron.down")
                        }
                        .padding(.horizontal, 5)
                        .onTapGesture {
                            withAnimation {
                                showDetails = true
                            }
                        }
                        
                        Rectangle()
                            .frame(height: 1.6)
                            .padding(.horizontal, 8)
                        
                        HStack {
                            Image("Download icon")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 30)
                                .padding(.trailing, 7)
                            
                            Text("Сохранить чек в PDF?")
                                .font(.system(size: 20, weight: .medium))
                            
                            Spacer()
                        }
                        .padding(.horizontal, 5)
                        
                        HStack {
                            Image("Menu icon")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 30)
                                .padding(.trailing, 7)
                            
                            Text("Фискальный чек")
                                .font(.system(size: 20, weight: .medium))
                            
                            Spacer()
                        }
                        .padding(.horizontal, 5)
                    }
                    
                    Toggle(
                        isOn: $onOff,
                        label: {
                            Text("Сохранить шаблон?")
                                .font(.system(size: 20, weight: .medium))
                                .padding(.horizontal, 8)
                        }
                    )
                    .padding(.vertical, 15)
                    .tint(Color("Uzum"))
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(Color("Panel background"))
                )
                .padding()
                
                Button(
                    action: {
                        dismiss()
                    },
                    label: {
                        Text("Домой")
                            .foregroundStyle(.white)
                            .font(.system(size: 20, weight: .medium))
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(
                                RoundedRectangle(cornerRadius: 15)
                                    .foregroundStyle(Color("Uzum"))
                            )
                            .padding(.horizontal)
                    }
                )
            }
            
            if showDetails {
                Color.white.opacity(0.4)
                    .ignoresSafeArea()
                    .onTapGesture {
                        withAnimation {
                            showDetails = false
                        }
                    }
                
                VStack(alignment: .leading, spacing: 8) {
                    DetailsText(
                        title: "Sender name",
                        text: senderName
                    )
                    
                    DetailsText(
                        title: "Sender",
                        text: sender
                    )
                    
                    DetailsText(
                        title: "Reciver name",
                        text: reciverName
                    )
                    
                    DetailsText(
                        title: "Reciver",
                        text: reciver
                    )
                    
                    DetailsText(
                        title: "Comission",
                        text: "\(comission).00"
                    )
                    
                    DetailsText(
                        title: "Recived money",
                        text: "\(money).00"
                    )
                    
                    DetailsText(
                        title: "Date",
                        text: showDate(date: date)
                    )
                    
                    DetailsText(
                        title: "Transaction number",
                        text: "ad3a48akdfg6-da"
                    )
                }
                .padding(.horizontal, 30)
                .padding(.vertical, 20)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(Color("Panel background"))
                )
                .padding()
            }
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    UzumBankSimpleCheck(
        money: "13 000",
        senderName: "senderName",
        sender: "senderCard",
        reciverName: "reciverName",
        reciver: "reciverCard",
        comission: "percent",
        date: Date()
    )
}

struct DetailsText: View {
    let title: String
    let text: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(title):")
                .foregroundStyle(.gray)
                .font(.system(size: 16))
            Text(text)
                .foregroundStyle(.white)
                .font(.system(size: 17))
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

func showDate(date: Date) -> String {
    let dateFormatter = DateFormatter()
    
    dateFormatter.dateFormat = "dd.MM.YYYY HH.mm.ss"
    
    return dateFormatter.string(from: date)
}
