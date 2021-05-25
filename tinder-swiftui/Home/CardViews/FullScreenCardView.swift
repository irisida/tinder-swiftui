//
//  FullScreenCardView.swift
//  tinder-swiftui
//
//  Created by ed on 25/05/2021.
//

import SwiftUI

struct FullScreenCardView: View {
    var person: Person
    
    @Binding var fullScreenMode: Bool
    
    let screen = UIScreen.main.bounds
    
    @EnvironmentObject var userMgr: UserManager
    
    var nameSpace: Namespace.ID
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Color.white.edgesIgnoringSafeArea(.all)
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 0) {
                    CardImageScroller(person: person, fullScreenMode: $fullScreenMode)
                        .frame(width: screen.width, height: screen.height * 0.7)
                        .matchedGeometryEffect(id: "image\(person.id)", in: nameSpace)
                    
                    HStack {
                        VStack(alignment: .leading) {
                            HStack {
                                Text(person.name)
                                    .font(.system(size: 32, weight: .semibold))
                                
                                Text(String(person.age))
                                    .font(.system(size: 26, weight: .light))
                                
                                Spacer()
                            }
                            .opacity(0.75)
                        
                            Text("\(person.distance) miles away")
                                .font(.system(size: 18, weight: .medium))
                                .opacity(0.75)
                        }
                        .padding([.horizontal, .top], 16)
                        
                        Button(action: {
                            fullScreenMode = false
                        }, label: {
                            Image(systemName: "arrow.down.circle.fill")
                                .font(.system(size: 42))
                                .background(Color.white)
                                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        })
                        .padding(.trailing, 16)
                        .offset(y: -40)
                    }
                    
                    Spacer().frame(height: 26)
                    
                    HStack {
                        Text(person.bio)
                            .font(.system(size: 16, weight: .medium))
                            .lineLimit(12)
                            .multilineTextAlignment(.leading)
                            .fixedSize(horizontal: false, vertical: true)
                            .opacity(0.75)
                            .padding(.horizontal, 16)
                    }
                    
                    Spacer().frame(height: 32)
                    
                    VStack(spacing: 24) {
                        Button(action: {
                            showActionSheet()
                        }, label: {
                            VStack(spacing: 8) {
                                Text("Share \(person.name)'s Profile")
                                    .font(.system(size: 16, weight: .medium))
                                
                                Text("See what a friend thinks")
                                    .font(.system(size: 14, weight: .medium))
                            }
                            .opacity(0.8)
                        })
                        
                        Button(action: {
                            
                        }, label: {
                            Text("REPORT \(person.name)")
                        })
                    }
                    
                    Spacer().frame(height: 200)
                }
            }
            
            HStack(spacing: 20) {
                Spacer()
                
                CircleButtonView(type: .no) {
                    fullScreenMode = false
                    userMgr.swipe(person, direction: .nope)
                }
                .frame(height: 40)
                
                CircleButtonView(type: .star) {
                    fullScreenMode = false
                    userMgr.superLike(person)
                }
                .frame(height: 60)
                
                CircleButtonView(type: .heart) {
                    fullScreenMode = false
                    userMgr.swipe(person, direction: .like)
                }
                .frame(height: 40)
                
                Spacer()
            }
            .padding(.vertical, 24)
            .edgesIgnoringSafeArea(.bottom)
            .background(
                LinearGradient(
                        gradient: Gradient(colors: [Color.white.opacity(0.2), Color.white]),
                        startPoint: .top,
                        endPoint: .bottom))
            
        }
        .edgesIgnoringSafeArea(.bottom)
        .padding(.top, 32)
    }
    
    func showActionSheet() {
        let items: [Any] = ["What do you think about \(person.name)? \n"]
        let av = UIActivityViewController(activityItems: items, applicationActivities: nil)
        UIApplication.shared.windows.first?.rootViewController?.present(av, animated: true, completion: nil)
    }
}

struct FullScreenCardView_Previews: PreviewProvider {
    @Namespace static var placeholderNamespace
    static var previews: some View {
        FullScreenCardView(person: Person.example3, fullScreenMode: .constant(true), nameSpace: placeholderNamespace)
    }
}
