//
//  ProfileView.swift
//  tinder-swiftui
//
//  Created by ed on 22/05/2021.
//

import SwiftUI

struct ProfileView: View {
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            // user profile, image, name & job details
            Group {
                ZStack(alignment: .topTrailing) {
                    RoundedImage(url: URL(string: "https://picsum.photos/400"))
                        .frame(height: 160)
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Image(systemName: "pencil")
                            .font(.system(size: 18, weight: .heavy))
                            .foregroundColor(Color.activeTabGray)
                            .frame(width: 32, height: 32)
                            .background(Color.white)
                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                            .shadow(color: Color.mediumDropShadow, radius: 6, x: 1.5, y: 5)
                    })
                    .padding(.vertical, 16)
                    .offset(x: -4)
                }
                
                Spacer().frame(height: 24)
                
                Text("Ed, 30")
                    .foregroundColor(.textTitle)
                    .font(.system(size: 26, weight: .medium))
                
                Spacer().frame(height: 8)
                
                Text("Software Engineer")
                    .foregroundColor(.textTitle)
                
                Spacer().frame(height: 16)
            }
            
            
            // profile button controls for settings, add media & safety
            Group {
                HStack(alignment: .bottom) {
                    
                    Spacer()
                    
                    // settings
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        VStack {
                            Image(systemName: "gearshape.fill")
                                .foregroundColor(.textSecondary)
                                .font(.system(size: 30))
                                .padding(8)
                                .background(Color.white)
                                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                .shadow(color: Color.lightDropShadow, radius: 6, x: 1, y: 3)
                            
                            Text("SETTINGS")
                                .font(.system(size: 14, weight: .medium))
                                .foregroundColor(Color.textSecondary)
                            
                        }
                    })
                    
                    Spacer()
                    
                    // add media
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        VStack {
                            Image(systemName: "camera.fill")
                                .foregroundColor(.white)
                                .font(.system(size: 32))
                                .padding(16)
                                .background(Color.red)
                                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                .shadow(color: Color.lightDropShadow, radius: 6, x: 1, y: 3)
                            
                            Text("ADD MEDIA")
                                .font(.system(size: 14, weight: .medium))
                                .foregroundColor(Color.textSecondary)
                            
                        }
                    })
                    
                    Spacer()
                    
                    // safety
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        VStack {
                            Image(systemName: "shield.fill")
                                .foregroundColor(.textSecondary)
                                .font(.system(size: 30))
                                .padding(8)
                                .background(Color.white)
                                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                .shadow(color: Color.lightDropShadow, radius: 6, x: 1, y: 3)
                            
                            Text("SAFETY")
                                .font(.system(size: 14, weight: .medium))
                                .foregroundColor(Color.textSecondary)
                            
                        }
                    })
                    
                    Spacer()
                }
            }
            
            Spacer().frame(height: 16)
            
            HStack {
                Text("Photo Tip: Make a splash with your photo to get more likes.")
                    .multilineTextAlignment(.leading)
                    .lineLimit(3)
                    .foregroundColor(.white)
                    .font(.system(size: 14))
                
                Button(action: {
                    //
                }, label: {
                    Image(systemName: "plus")
                        .font(.system(size: 12, weight: .heavy))
                        .foregroundColor(.pink)
                        .padding(6)
                })
                .background(Color.white)
                .clipShape(Circle())
            }
            .padding()
            .background(Color.pink)
            .cornerRadius(12)
            .padding(.horizontal, 16)
            
            ZStack {
                Color.panelBackground.edgesIgnoringSafeArea(.bottom)
                
                ProfileSwipePromo {
                    //
                }
                
            }
            .padding(.top, 16)
        }
        .padding(.top, 8)
        
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .background(Color.defaultBackground)
            
    }
}
