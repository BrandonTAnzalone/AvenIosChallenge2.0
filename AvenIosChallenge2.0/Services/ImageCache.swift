//
//  ImageCache.swift
//  AvenIosChallenge2.0
//
//  Created by Brandon Anzalone on 2/1/22.
//

import Foundation
import UIKit

class ImageCache {
    
    // MARK: - PROPERTIES
    
    static let shared = ImageCache()
    
    let cache = NSCache<NSString, UIImage>()
    
    // MARK: - METHODS
    
    /**
        Gets an image from the cache.
     
        - parameter url: The url of the image to get.
     
        - returns The image or nil if the image is not in the cache.
     */
    func getImage(url: String) -> UIImage? {
        if let image = cache.object(forKey: url as NSString) {
            return image
        } else if let image = readImage(named: fileNameFrom(url)) {
            return image
        } else {
            return nil
        }
    }
    
    /**
        Saves an image to the cache.
     
        - parameter image: The image to save.
        - parameter url: The url of the image to save.
     */
    func saveImage(_ image: UIImage, from url: String) {
        cache.setObject(image, forKey: url as NSString)
        writeImage(image, named: fileNameFrom(url))
    }
    
    /**
        Attempts to read a named image from the app's Documents directory.
     
        - parameter fileName: The name of the image to read.
     
        - Returns The image, or nil if the image could not be read.
     */
    private func readImage(named fileName: String) -> UIImage? {
        
        guard let filePath = append(toPath: documentDirectory(), withPathComponent: fileName) else {
            return nil
        }
        
        return UIImage(contentsOfFile: filePath)
    }
    
    /**
        Converts a URL string to a file name by removing all but the last component of the URL.
     
        - parameter url: A URL string.
     
        - Returns The file name component of the URL.
     */
    private func fileNameFrom(_ url: String) -> String {
        let fileArray = url.components(separatedBy: "/")
        return fileArray.last!
    }

    /**
        Creates a pathname for a file by appending a file's name to the end of a directory pathname.
     
        - parameter path: Pathname for a directory.
        - parameter pathComponent: A  file name
     
        - Returns Pathname for the file.
     */
    private func append(toPath path: String, withPathComponent pathComponent: String) -> String? {
        if var pathURL = URL(string: path) {
            pathURL.appendPathComponent(pathComponent)
            
            return pathURL.absoluteString
        }
        
        return nil
    }
    
    /**
        Obtains and returns the pathname of the app's Documents directory.
     
        - Returns The pathname of the app's Documents directory.
     */

    private func documentDirectory() -> String {
        let documentDirectoryArray = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        return documentDirectoryArray[0]
    }
    
    /**
        Writes an image to the app's Documents directory.
     
        - parameter image: The image to write.
        - parameter fileName: The file name to which the image will be written.
     */
    private func writeImage(_ image: UIImage, named fileName: String) {
        let fileManager = FileManager.default
        
        guard let filePath = append(toPath: documentDirectory(), withPathComponent: fileName) else {
            return
        }
        
        let imageData = image.jpegData(compressionQuality: 1.0)
        fileManager.createFile(atPath: filePath, contents: imageData, attributes: nil)
    }
}
