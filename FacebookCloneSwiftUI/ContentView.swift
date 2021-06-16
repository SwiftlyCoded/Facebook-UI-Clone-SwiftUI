//
//  ContentView.swift
//  FacebookCloneSwiftUI
//
//  Created by Alex on 16/06/2021.
//

import SwiftUI

let primary = Color(#colorLiteral(red: 0.1410247684, green: 0.144975543, blue: 0.1532749236, alpha: 1))
let secondary = Color(#colorLiteral(red: 0.2313431799, green: 0.2313894629, blue: 0.2313401997, alpha: 1))
let ternary = Color(#colorLiteral(red: 0.09396985918, green: 0.09791258723, blue: 0.1062180027, alpha: 1))
let lightGray = Color(#colorLiteral(red: 0.681789577, green: 0.6977746487, blue: 0.7185279727, alpha: 1))

struct ContentView: View {
    var body: some View {
        ZStack{
            primary
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                ScrollView(showsIndicators: false){
                    Header()
                    CreatePost()
                    Divider()
                    StoryFeed()
                    Divider()
                    PostFeed()
                }
                
                Spacer()
                
                Menu()
            }
            .foregroundColor(.white)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Header: View{
    var body: some View{
        HStack {
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 60)
            Spacer()
            Image(systemName: "magnifyingglass")
                .font(.system(size: 18))
                .padding(8)
                .background(secondary)
                .clipShape(Circle())
            
            Image(systemName: "message.fill")
                .font(.system(size: 18))
                .padding(8)
                .background(secondary)
                .clipShape(Circle())
        }
        .padding(.horizontal)
    }
}

struct CreatePost: View{
    var body: some View{
        VStack{
            HStack{
                Image("profilePic")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                Text("What's on your mind?")
                Spacer()
            }
            .padding(.horizontal)
            
            Rectangle()
                .frame(width: UIScreen.main.bounds.width, height: 1)
                .foregroundColor(secondary)
            
            HStack{
                Spacer()
                HStack{
                    Image(systemName: "video.fill")
                        .foregroundColor(.red)
                    Text("Live")
                }
                
                Spacer()
                Rectangle()
                    .frame(width: 1, height: 20)
                    .foregroundColor(secondary)
                Spacer()
                HStack{
                    Image(systemName: "photo")
                        .foregroundColor(.green)
                    Text("Photo")
                }
                Spacer()
                Rectangle()
                    .frame(width: 1, height: 20)
                    .foregroundColor(secondary)
                
                Spacer()
                Group {
                    HStack{
                        Image(systemName: "video.fill")
                            .foregroundColor(.purple)
                        Text("Room")
                    }
                    
                    Spacer()
                }
   
            }
            .font(.system(size: 14, weight: .semibold))
        }
    }
}

struct Divider: View{
    var body: some View{
        Rectangle()
            .frame(width: UIScreen.main.bounds.width, height: 6)
            .foregroundColor(ternary)
    }
}

struct MyStoryCard: View{
    var body: some View{
        ZStack(alignment: .top){
            RoundedRectangle(cornerRadius: 15)
                .frame(width: 100, height: 170)
                .foregroundColor(secondary)
            
            ZStack(alignment: .bottom){
                Image("profilePic")
                    .resizable()
                    .frame(width: 100, height: 110)
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                
                VStack(spacing: 0){
                    Image(systemName: "plus")
                        .foregroundColor(.white)
                        .padding(5)
                        .background(Color.blue)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        .font(.system(size: 20, weight: .bold))
                        .overlay(Circle().stroke(secondary, lineWidth: 3))
                    
                    Group{
                        Text("Create")
                        Text("story")
                    }
                    .font(.system(size: 12, weight: .semibold))
                }
                .offset(y: 45)
            }
        }
    }
}

struct StoryCard: View{
    
    let imageName: String
    let profilePic: String
    let title: String
    
    var body: some View{
        ZStack(alignment: .leading){
            Image(imageName)
                .resizable()
                .frame(width: 100, height: 170)
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 15))
            
            VStack(alignment: .leading, spacing: 100){
                Image(profilePic)
                    .resizable()
                    .frame(width: 35, height: 35)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .overlay(Circle().stroke(Color.blue, lineWidth: 4))
                
                Text(title)
                    .font(.system(size: 12, weight: .semibold))
            }
            .padding(.leading, 8)
        }
    }
}

struct StoryFeed: View{
    
    let titles = ["Craig", "Boulevard", "SneakerSet", "Anna"]
    
    var body: some View{
        ScrollView(.horizontal, showsIndicators: false){
            HStack{
                MyStoryCard()
                ForEach(1..<5){ i in
                StoryCard(imageName: "Story\(i)", profilePic: "profilePic\(i)", title: titles[i-1])
                }
            }
            .padding(.leading)
            .padding(.vertical, 5)
        }
    }
}

struct Post: View{
    var body: some View{
        VStack{
            HStack{
                Image("swiftlyCoded")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                
                VStack(alignment: .leading, spacing: 0){
                    HStack{
                        Text("Swiftly Coded")
                            .font(.system(size: 14, weight: .semibold))
                        Image(systemName: "checkmark")
                            .font(.system(size: 8, weight: .bold))
                            .padding(2)
                            .background(Color.blue)
                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    }
                    
                    HStack(spacing: 5){
                        Text("1 d")
                        Circle()
                            .frame(width: 2, height: 2)
                        Image(systemName: "globe")
                    }
                    .font(.system(size: 12))
                    .foregroundColor(lightGray)
                }
                Spacer()
                Image(systemName: "ellipsis")
                    .foregroundColor(lightGray)
            }
            .padding(.horizontal)
            
            Text("WWDC21 on the way this year with great new tweaks and features for SwiftUI 3.0 <3")
                .padding(.horizontal)
                .font(.system(size: 14))
            Image("wwdc")
                .resizable()
                .scaledToFit()
            
            HStack{
                HStack(spacing: 3){
                    Image("icons")
                        .resizable()
                        .frame(width: 35, height: 18)
                    Text("123k")
                }
                Spacer()
                HStack{
                    Text("12k comments")
                    Text("3k shares")
                    Image("profilePic")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    Image(systemName: "arrowtriangle.down.fill")
                }
            }
            .foregroundColor(lightGray)
            .font(.system(size: 12))
            .padding(.horizontal)
            
            Rectangle()
                .frame(width: UIScreen.main.bounds.width - 15, height: 0.3)
            
            HStack{
                HStack{
                    Image(systemName: "hand.thumbsup")
                    Text("Like")
                }
                
                Spacer()
                
                HStack{
                    Image(systemName: "message")
                    Text("Comment")
                }
                
                Spacer()
                
                HStack{
                    Image(systemName: "arrowshape.turn.up.right")
                    Text("Share")
                }
            }
            .foregroundColor(lightGray)
            .font(.system(size: 14))
            .padding(.horizontal)
        }
    }
}

struct PostFeed: View{
    var body: some View{
        VStack{
            ForEach(1..<5){ i in
                Post()
                Divider()
            }
        }
    }
}

struct Menu: View{
    var body: some View{
        HStack(spacing: 45){
            Image(systemName: "house.fill")
                .foregroundColor(.blue)
            Image(systemName: "play")
            Image(systemName: "house")
            Image(systemName: "bell")
            Image(systemName: "line.horizontal.3")
        }
        .font(.system(size: 22))
    }
}
