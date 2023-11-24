//
//  TitleRow.swift
//  ChatApp
//
//  Created by Akbarshah Jumanazarov on 11/24/23.
//

import SwiftUI

struct TitleRow: View {
    var imageUrl = URL(string: "https://media.istockphoto.com/id/1438969575/photo/smiling-young-male-college-student-wearing-headphones-standing-in-a-classroom.webp?b=1&s=170667a&w=0&k=20&c=3jwddQH5X_5-1o3hCkZnI1zRyVRIgJXuwT0QqQOf2lM=")
    var name = "Sam Smith"
    
    var body: some View {
        HStack(spacing: 29) {
            AsyncImage(url: imageUrl) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 50, height: 50)
                    .cornerRadius(50)
            } placeholder: {
                ProgressView()
            }
            
            VStack(alignment: .leading) {
                Text(name)
                    .font(.title)
                    .bold()
                Text("Online")
                    .foregroundStyle(.gray)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Image(systemName: "phone.fill")
                .padding(10)
                .foregroundStyle(.gray)
                .background(Color.white)
                .cornerRadius(50)
        }
        .padding()
    }
}

#Preview {
    TitleRow()
}
