//
//  MessageBubble.swift
//  ChatApp
//
//  Created by Akbarshah Jumanazarov on 11/24/23.
//

import SwiftUI

struct MessageBubble: View {
    var message: Message
    
    var body: some View {
        VStack(alignment: message.received ? .leading : .trailing) {
            HStack {
                Text(message.text)
                    .padding(12)
                    .background(message.received ? .gray.opacity(0.2) : .pink.opacity(0.1))
                    .cornerRadius(30)
            }
            .frame(maxWidth: 300, alignment: message.received ? .leading : .trailing)
            
            Text("\(message.timeStamp.formatted(.dateTime.hour().minute()))")
                .font(.caption2)
                .padding(message.received ? .leading : .trailing)
        }
        .frame(maxWidth: .infinity, alignment: message.received ? .leading : .trailing)
        .padding(message.received ? .leading : .trailing, 8)
        .padding(.horizontal, 10)
    }
}

#Preview {
    MessageBubble(message: Message(id: "12345",
                                   text: "Hello",
                                   received: true,
                                   timeStamp: Date()))
}
