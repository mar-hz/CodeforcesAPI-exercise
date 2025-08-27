//
//  UserRowView.swift
//  CFAPI
//
//  Created by Alumno on 27/08/25.
//

import SwiftUI

struct UserRowView: View {
    let user : User
    
    var body: some View {
        HStack {
            // load user's avatar image, with a progressview placeholder
            AsyncImage(url: URL(string: user.avatar)) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .clipShape(Circle())
            } placeholder: {
                ProgressView()
            }
            .frame(width: 40, height: 40)
            .overlay (
                Circle()
                    .stroke(.green, lineWidth: 3)
            )
            Text(user.handle)
                .fontWeight(.semibold)
        }
    }
}

#Preview {
    UserRowView(user: User(
        handle: "chaibn",
        email: "hola@mail.com",
        vkId: "vkid",
        openId: "openid",
        firstName: "Marian",
        lastName: "Hernandez",
        country: "Mexico",
        city: "Monterrey",
        organization: "Tec",
        contribution: 100,
        rank: "grandmaster!!!",
        rating: 100000,
        maxRank: "winner",
        maxRating: 1000000,
        lastOnlineTimeSeconds: 100,
        registrationTimeSeconds: 200,
        friendOfCount: 10,
        avatar: "https://userpic.codeforces.org/3577028/title/ceb9165072d8224b.jpg",
        titlePhoto: "https://userpic.codeforces.org/3577028/title/ceb9165072d8224b.jpg"
    ))
}
