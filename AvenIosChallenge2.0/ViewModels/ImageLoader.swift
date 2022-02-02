//
//  ImageLoader.swift
//  AvenIosChallenge2.0
//
//  Created by Brandon Anzalone on 2/1/22.
//

import Foundation
import UIKit

class ImageLoader: ObservableObject {
    
    @Published var image: UIImage? = nil
    
    let imageCache = ImageCache.shared
    
    func downloadImage(url: String) {
        
        if let image = imageCache.getImage(url: url) {
            self.image = image
            return
        }
        
        guard let downloadURL = URL(string: url) else { return
        }
        
        weak var weakSelf = self
        
        URLSession.shared.dataTask(with: downloadURL) {
            (data, response, error) in
            
            let httpResponse = response as? HTTPURLResponse
            if httpResponse!.statusCode != 200 {
                print("HTTP Error: status code \(httpResponse!.statusCode)")
            } else if (data == nil && error != nil) {
                print("No data downloaded")
            } else {
                let image = UIImage(data: data!)
                DispatchQueue.main.async {
                    weakSelf!.image = image
                }
                weakSelf!.imageCache.saveImage(image!, from: url)
            }
        }.resume()
    }

}
