//
//  CardImageScroller.swift
//  tinder-swiftui
//
//  Created by ed on 24/05/2021.
//

import SwiftUI
import KingfisherSwiftUI

struct CardImageScroller: View {
    
    var person: Person
    
    @State private var imageIndex = 0
    
    @Binding var fullScreenMode: Bool
    
    let screen = UIScreen.main.bounds
    
    func updateImageIndex(addition: Bool) {
        let newIndex: Int
        
        if addition {
            newIndex = imageIndex + 1
        } else {
            newIndex = imageIndex - 1
        }
        
        // negative value handler as well as handling the
        // assignation to the positive side values within
        // the bounds of the count of images we actually
        // have in the array.
        imageIndex = min(max(0, newIndex), person.imageUrls.count - 1)
    }
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                ZStack {
                    KFImage(person.imageUrls[imageIndex])
                        .placeholder {
                            Color.white
                        }
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: geo.size.width, height: geo.size.height)
                        .clipped()
                    
                    HStack {
                        Rectangle()
                            .onTapGesture {
                                updateImageIndex(addition: false)
                            }
                        
                        Rectangle()
                            .onTapGesture {
                                updateImageIndex(addition: true)
                            }
                    }
                    .foregroundColor(Color.white.opacity(0.01))
                }
                
                // show the progress indicator for the index of
                // the photo being viewed within the collection
                // of photos that can be viewed.
                VStack {
                    HStack {
                        ForEach(0..<person.imageUrls.count) { imageIndex in
                            RoundedRectangle(cornerRadius: 20)
                                .frame(height: 4)
                                .foregroundColor(self.imageIndex == imageIndex ? Color.white : Color.gray.opacity(0.4))
                        }
                    }
                    .padding(.top, 12)
                    .padding(.horizontal, fullScreenMode ? 0 : 40) // conditional padding
                    
                    Spacer()
                    
                    // conditionally render the name and info for the
                    // profule depending the value pof the mode.
                    if !fullScreenMode {
                        ZStack {
                            Color.black.opacity(0.3)
                            
                            HStack {
                                VStack(alignment: .leading) {
                                    HStack {
                                        Text(person.name)
                                            .font(.system(size: 32, weight: .semibold))
                                        
                                        Text(String(person.age))
                                            .font(.system(size: 24, weight: .light))
                                    }
                                    
                                    Text(person.bio)
                                        .font(.system(size: 18))
                                        .lineLimit(2)
                                }
                                
                                Spacer()
                                
                                Button(action: {
                                    fullScreenMode = true
                                }, label: {
                                    Image(systemName: "info.circle.fill")
                                        .font(.system(size: 26, weight: .medium))
                                })
                            }
                            .padding()
                        }
                        .frame(height: screen.height / 7)
                    }
                }
                .foregroundColor(.white)
            }
            .cornerRadius(6)
            .shadow(radius: 5, x: 2, y: 3)
        }
    }
}

struct CardImageScroller_Previews: PreviewProvider {
    static var previews: some View {
        CardImageScroller(person: Person.example3, fullScreenMode: .constant(false))
    }
}
