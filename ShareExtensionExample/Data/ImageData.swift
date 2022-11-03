//
//  ImageData.swift
//  ShareExtensionExample
//
//  Created by 楊智茵 on 2022/11/3.
//

import Foundation
import UIKit

struct Images {
    let images: [UIImage]
    
    init() {
        
        var temp: [UIImage] = []
        
        (0...16).forEach { imageIndex in
            if let image = UIImage(named: "\(imageIndex)_img") {
                temp.append(image)
            }
        }
        self.images = temp
    }
}
