//
//  URLImage.swift
//  AvenIosChallenge2.0
//
//  Created by Brandon Anzalone on 2/1/22.
//

import SwiftUI

struct URLImage: View {
    
    let url: String
    
    @StateObject var imageLoader = ImageLoader()
    
    init(url: String) {
        self.url = url
    }
    
    var body: some View {
        Group {
            if let image = imageLoader.image {
                Image(uiImage: image)
                    .resizable()
            } else {
                Image("placeholder").resizable()
            }
        }
        .onAppear {
            imageLoader.downloadImage(url: url)
        }
    }

}

struct URLImage_Previews: PreviewProvider {
    static var previews: some View {
        URLImage(url: "https://www.prismnet.com/~mcmahon/CS321/Images/Presidents/placeholder.jpg")
            .previewLayout(.sizeThatFits)
    }
}
