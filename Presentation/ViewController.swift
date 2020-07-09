//
//  ViewController.swift
//  Presentation
//
//  Created by Mac on 07.07.2020.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // содержимое слайдов презентации
    let content: [Content] = [Title("Презентация", "")]
    
    // шаблоны для слайдов презентации
    var titleSC: TitleSubviewController!
    var imageAndTextSC: ImageAndTextSubviewController!
    var textSC: TextSubviewController!
    
    @IBOutlet var container: UIView!
    @IBOutlet var numPageLabel: UILabel!
    var pageNum: Int = 0
    
    // загрузка шаблонов и включение первого слайда презентации
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.titleSC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TitleSubview") as? TitleSubviewController
        self.imageAndTextSC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ImageAndTextSubview") as? ImageAndTextSubviewController
        self.textSC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TextSubview") as? TextSubviewController

        self.addChild(self.titleSC)
        self.addChild(self.imageAndTextSC)
        self.addChild(self.textSC)
        
        self.connectSubview()
    }
    
    // установка слайда презентации на основе одного из шаблонов
    func connectSubview() {
        self.setNumPageLabel()
        for sView in self.container.subviews {
            sView.removeFromSuperview()
        }
        
        let info = self.content[self.pageNum]
        switch info.id {
            case "TitleSubview":
                self.titleSC.view.frame = self.container.bounds
                self.titleSC.setProperties(info.titleText, (info as! Title).subtitleText)
                self.container.addSubview(self.titleSC.view)
                break
            case "ImageAndTextSubview":
                self.imageAndTextSC.view.frame = self.container.bounds
                self.imageAndTextSC.setProperties(info.titleText, (info as! ImageAndText).text)
                self.container.addSubview(self.imageAndTextSC.view)
                break
            case "TextSubview":
                self.textSC.view.frame = self.container.bounds
                self.textSC.setProperties(info.titleText, (info as! Text).mainText)
                self.container.addSubview(self.textSC.view)
                break
            default:
                break
        }
    }
    
    func setNumPageLabel() {
        self.numPageLabel.text = self.content.count > 0 ? "\(self.pageNum + 1)/\(self.content.count)" : "--/--"
    }
    
    @IBAction func backButton(_ sender: Any) {
        guard self.pageNum - 1 >= 0 else { return }
        self.pageNum -= 1
        self.connectSubview()
    }
    
    
    @IBAction func nextButton(_ sender: Any) {
        guard self.pageNum + 1 < self.content.count else { return }
        self.pageNum += 1
        self.connectSubview()
    }
    
}



class TitleSubviewController: UIViewController {
    
    @IBOutlet var titleText: UILabel!
    @IBOutlet var subtitleText: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func setProperties(_ titleText: String, _ subtitleText: String) {
        self.titleText.text = titleText
        self.subtitleText.text = subtitleText
    }
    
}


class ImageAndTextSubviewController: UIViewController {
    
    @IBOutlet var leftImage: UIImageView!
    @IBOutlet var rightText: UILabel!
    @IBOutlet var titleText: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func setProperties(_ titleText: String, _ text: String, _ imageName: String? = nil) {
        self.titleText.text = titleText
        self.rightText.text = text
        if let name = imageName {
            self.leftImage.image = UIImage(named: name)
        }
    }
    
}


class TextSubviewController: UIViewController {
    
    @IBOutlet var titleText: UILabel!
    @IBOutlet var mainText: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func setProperties(_ titleText: String, _ mainText: String) {
        self.titleText.text = titleText
        self.mainText.text = mainText
    }
    
}
