//
//  MessageField.swift
//  ChatApp
//
//  Created by Akbarshah Jumanazarov on 11/24/23.
//

import SwiftUI

struct MessageField: View {
    @EnvironmentObject var env: MessagesManager
    @State private var message = ""
    
    var body: some View {
        HStack {
            CustomTextField(text: $message, placeholder: "Type something...")
            
            Button {
                env.sendMessage(text: message)
                message = ""
            } label: {
                Image(systemName: "paperplane.fill")
                    .foregroundStyle(.white)
                    .padding(10)
                    .background(Color.pink.opacity(0.2))
                    .cornerRadius(50)
            }
        }
        .padding(10)
        .background(Color.gray.opacity(0.2))
        .cornerRadius(50)
        .padding()
    }
}

#Preview {
    MessageField()
        .environmentObject(MessagesManager())
}

struct CustomTextField: View {
    @Binding var text: String
    var placeholder: String
    var editingChanged: (Bool) -> () = {_ in}
    var commit: () -> () = {}
    
    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty {
                    Text(placeholder)
                    .opacity(0.5)
            }
            
            TextField("", text: $text, onEditingChanged: editingChanged, onCommit: commit)
        }
        .padding(.leading, 8)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
