//
//  RoundedImage.swift
//  tinder-swiftui
//
//  Created by ed on 23/05/2021.
//

import SwiftUI
import KingfisherSwiftUI

struct RoundedImage: View {
    
    // accepts a URL to show as a rounded image
    var url: URL?
    
    
    // note that no frame limitation are applied and are by
    // default a responsibility handed to the parent to keep
    // the maximum flexibility and reusability. 
    var body: some View {
        KFImage(url)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
    }
}

struct RoundedImage_Previews: PreviewProvider {
    static var previews: some View {
        RoundedImage(url: URL(string: "https://picsum.photos/400"))
    }
}
