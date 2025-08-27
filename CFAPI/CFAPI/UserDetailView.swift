//
//  UserDetailView.swift
//  CFAPI
//
//  Created by Alumno on 27/08/25.
//

import SwiftUI

struct UserDetailView: View {
    let user : User
    var nameText = ""
    
    var body: some View {
        VStack{
            // user's profile picture, with a progressview placeholder
            AsyncImage(url: URL(string: user.avatar)) { image in
                image
                    .resizable()
                    .scaledToFill()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 250, height: 250)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .overlay (
                RoundedRectangle(cornerRadius: 20)
                    .stroke(.green, lineWidth: 5)
            )
            .padding()
            
            Text(user.handle)
                .font(.title)
                .fontWeight(.bold)
            
            // check if the user shared their name and display it
            // otherwise, no name is displayed
            if (user.firstName != nil && user.lastName != nil) {
                Text(user.firstName! + " " + user.lastName!)
            } else if (user.firstName != nil) {
                Text(user.firstName!)
            }
            
            List {
                Text("Rank: ").fontWeight(.bold) + Text(user.rank)
                Text("Rating: ").fontWeight(.bold) + Text("\(user.rating)")
                // only displayed if user shared country info
                if (user.country != nil) {
                    Text("Country: ").fontWeight(.bold) + Text(user.country!)
                }
                // only displayed if user shared org info
                if (user.organization != nil) {
                    Text("Organization: ").fontWeight(.bold) + Text(user.organization!)
                }
                Text("Friend of: ").fontWeight(.bold) + Text("\(user.friendOfCount) users")
                // date is in UNIX format, so it's formatted
                // with a function defined below
                Text("Last Online: ").fontWeight(.bold) + Text(formattedDate(from: user.lastOnlineTimeSeconds))
            }
            .padding(.top)
        }
        .padding()
    }
    
    // Receives date in UNIX format and returns a formatted date string
    func formattedDate(from timestamp: Int) -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(timestamp))
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
}

#Preview {
    UserDetailView(user: User(
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
