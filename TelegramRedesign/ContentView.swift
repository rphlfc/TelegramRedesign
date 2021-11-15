//
//  ContentView.swift
//  TelegramRedesign
//
//  Created by Raphael Cerqueira on 14/11/21.
//

import SwiftUI

struct ContentView: View {
    @State var selectedTabIndex: Int = 1
    
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .ignoresSafeArea()
            
            TabView(selection: $selectedTabIndex) {
                Text("Calls")
                    .tag(0)
                
                HomeView()
                    .tag(1)
                
                Text("Write")
                    .tag(2)
                
                Text("People")
                    .tag(3)
                
                Text("Settings")
                    .tag(4)
            }
            .overlay(
                HStack {
                    ForEach(0 ..< tabItems.count) { index in
                        if index == 2 {
                            Circle()
                                .fill(Color("PrimaryColor"))
                                .frame(width: 60, height: 60)
                                .overlay(
                                    Image(systemName: tabItems[index])
                                )
                                .shadow(color: Color("PrimaryColor"), radius: 10, x: 0, y: 0)
                                .offset(y: -10)
                        } else {
                            Image(systemName: tabItems[index])
                                .font(.title2)
                                .foregroundColor(selectedTabIndex == index ? Color("PrimaryColor") : Color("AccentColor"))
                            .frame(maxWidth: .infinity)
                            .onTapGesture {
                                selectedTabIndex = index
                            }
                        }
                    }
                }
                .background(Color("TabBarColor").ignoresSafeArea(.all, edges: .bottom))
                
                , alignment: .bottom
            )
        }
    }
}

let tabItems = [
    "phone", "bubble.left", "pencil", "person.2", "gearshape"
]

struct HomeView: View {
    var body: some View {
        VStack(spacing: 15) {
            header
            
            menuList
            
            messagesList
        }
    }
}

extension HomeView {
    private var header: some View {
        HStack {
            Circle()
                .fill(Color("PrimaryColor"))
                .frame(width: 40, height: 40)
                .overlay(
                    Image(systemName: "paperplane.fill")
                        .foregroundColor(.white)
                )
                .shadow(color: Color("PrimaryColor").opacity(0.7), radius: 10, x: 0, y: 0)
            
            Text("Telegram")
                .font(.title.bold())
                .foregroundColor(Color("AccentColor"))
            
            Spacer()
            
            Button {
                
            } label: {
                Image(systemName: "magnifyingglass")
                    .font(.title2.bold())
                    .foregroundColor(Color("AccentColor"))
            }
        }
        .padding(.horizontal)
    }
    
    private var menuList: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 15) {
                ForEach(menuItems) { item in
                    VStack(alignment: .leading, spacing: 8) {
                        Spacer()
                        
                        Image(systemName: item.image)
                            .font(.title)
                            .shadow(color: Color("AccentColor").opacity(0.7), radius: 10, x: 0, y: 0)
                        
                        Text(item.title)
                            .fontWeight(.semibold)
                    }
                    .foregroundColor(Color("AccentColor"))
                    .padding()
                    .frame(width: 140, height: 160, alignment: .leading)
                    .background(item.color)
                .cornerRadius(15)
                }
            }
            .padding(.horizontal)
        }
    }
    
    private var messagesList: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 25) {
                ForEach(messages) { message in
                    VStack(spacing: 25) {
                        HStack(spacing: 15) {
                            Image(message.fromImage)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 55, height: 55)
                                .clipShape(Circle())
                            
                            VStack(alignment: .leading, spacing: 4) {
                                if message.groupName != nil {
                                    Text(message.groupName!)
                                        .font(.headline)
                                }
                                    
                                Text(message.fromName)
                                    .font(.headline)
                                    
                                Text(message.lastMessage)
                                    .font(.callout)
                                    .foregroundColor(.gray)
                                    .lineLimit(2)
                            }
                            .foregroundColor(Color("AccentColor"))
                            
                            Spacer()
                            
                            VStack(alignment: .trailing, spacing: 8) {
                                HStack(spacing: 8) {
                                    if message.seen {
                                        ZStack {
                                            Image(systemName: "checkmark")
                                            
                                            Image(systemName: "checkmark")
                                                .offset(x: 4)
                                        }
                                        .font(.caption)
                                        .foregroundColor(Color.green)
                                    }
                                    
                                    Text(message.time)
                                        .font(.footnote.bold())
                                        .foregroundColor(Color("AccentColor"))
                                }
                                
                                if message.count > 0 {
                                    Circle()
                                        .fill(Color("PrimaryColor"))
                                        .frame(width: 21, height: 21)
                                        .overlay(
                                            Text("\(message.count)")
                                                .font(.caption)
                                                .foregroundColor(Color.white)
                                        )
                                        .shadow(color: Color("PrimaryColor").opacity(0.7), radius: 10, x: 0, y: 0)
                                }
                            }
                        }
                    }
                    .padding(.horizontal)
                }
            }
            .padding(.top)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            
            ContentView()
                .preferredColorScheme(.dark)
        }
    }
}
