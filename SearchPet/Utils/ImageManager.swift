//
//  ImageManager.swift
//  SearchPet
//
//  Created by Diego Olmo Cejudo on 21/11/21.
//

import UIKit

class ImageManager {
    var cache:ImageCache
    static let shared = ImageManager()
     
    init(cache:ImageCache = ImageCache()) {
        self.cache = cache
    }
    
    func image(path:String,cache:ImageCaching) -> UIImage? {
        let url = URL(string: path)!
        if let image = cache.imageFromCacheWithURL(url: url) {
            return image
        } else {
            var image:UIImage?
            do {
                let data = try Data(contentsOf: url)
                image = UIImage(data: data)
                cache.saveImageToCache(image: image, url: url)
                return image
            } catch {
                return nil
            }
        }
    }
    
    func image(path:String) -> UIImage? {
        return image(path: path, cache: self.cache)
    }
}
