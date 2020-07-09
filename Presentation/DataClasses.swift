//
//  DataClasses.swift
//  Presentation
//
//  Created by Mac on 07.07.2020.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
import UIKit

protocol Content {
    var titleText: String { get set }
    var id: String { get set }
}

class Title: Content {
    
    var titleText: String
    var subtitleText: String

    var id = "TitleSubview"
    
    init(_ titleText: String, _ subtitleText: String) {
        self.titleText = titleText
        self.subtitleText = subtitleText
    }
    
}

class ImageAndText: Content {
    
    var titleText: String
    var text: String
    var imageName: String
    
    var id = "ImageAndTextSubview"
    
    init(_ titleText: String, _ text: String, _ imageName: String) {
        self.titleText = titleText
        self.text = text
        self.imageName = imageName
    }
    
}

class Text: Content {
    
    var titleText: String
    var mainText: String

    var id = "TextSubview"
    
    init(_ titleText: String, _ mainText: String) {
        self.titleText = titleText
        self.mainText = mainText
    }
    
}
