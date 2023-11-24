//
//  ContentView.swift
//  ChatApp
//
//  Created by Akbarshah Jumanazarov on 11/24/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var vm = MessagesManager()
    var messagesArray = ["Hi", "How are you?", "When will we meet?"]
    
    var body: some View {
        VStack {
            VStack {
                TitleRow()
                
                ScrollViewReader { proxy in
                    ScrollView {
                        ForEach(vm.messages, id: \.id) { message in
                            MessageBubble(message: message)
                        }
                    }
                    .padding(.top, 10)
                    .background(Color.white)
                    .cornerRadius(30, corners: [.topLeft, .topRight])
                    .onChange(of: vm.lastMsgID) { id in
                        withAnimation {proxy.scrollTo(id, anchor: .bottom)}
                    }
                }
            }
            .background(Color.pink.opacity(0.2))
            .edgesIgnoringSafeArea(.bottom)
            
            MessageField()
                .environmentObject(vm)
        }
    }
}

#Preview {
    ContentView()
}
