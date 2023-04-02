//
//  ViewController.swift
//  flying off into the distance text like in Star Wars movies
//
//  Created by Raiden Yamato on 02.04.2023.
//

import UIKit

class ViewController: UIViewController {

    var openingCrawl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        view.backgroundColor = .black
        
        let titleParagraphStyle = NSMutableParagraphStyle()
        titleParagraphStyle.alignment = .center
        
        let textParagraphStyle = NSMutableParagraphStyle()
        textParagraphStyle.alignment = .justified
        
        let titleAtributes =
        [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 32), NSAttributedString.Key.paragraphStyle: titleParagraphStyle]
        
        let textAttributes =
        [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 22), NSAttributedString.Key.paragraphStyle: textParagraphStyle]
        
        let mainText = "It is a period of civil war. People BIKESHED proposals while Swift itself still hasn't finished compiling code written during the OLD REPUBLIC.\n\nXCODE crashes faster than a speeder bike on Endor, but undeterred Apple unleashed a new wave of Auto Layout problems with THE NOTCH.\n\nMeanwhile, the GALACTIC EMPI — er, GOOGLE — are building an army of clones using Java Kotlin Flutter. Now all hopes for the REBEL ALLIANCE lie with Swift's developers, who must add features, fix bugs, and, most importantly, prepare t— ERROR Assertion failed: (hasInterfaceType() && \"No interface type was set\"), function getInterfaceType, file /Users/Crusty/workspace/swift/AST/Decl.cpp line 1977."
        
        
        let title = NSMutableAttributedString(string: "EPISODE LLVM\nSWIFT EVOLUTION\n", attributes: titleAtributes)
        let text = NSAttributedString(string: mainText, attributes: textAttributes)
        title.append(text)
        
        openingCrawl = UILabel()
        openingCrawl.translatesAutoresizingMaskIntoConstraints = false
        openingCrawl.attributedText = title
        openingCrawl.textColor = UIColor(red: 250/255.0, green: 226/255.0, blue: 83/255.0, alpha: 1)
        openingCrawl.numberOfLines = 0
        
        let labelSize = openingCrawl.sizeThatFits(CGSize(width: view.bounds.width - 20, height: CGFloat.greatestFiniteMagnitude))
        openingCrawl.frame = CGRect(x: 10 - (view.bounds.width / 2), y: 0, width: labelSize.width, height: labelSize.height)
        
        
        let layer = CATransformLayer()
        layer.position = CGPoint(x: view.bounds.midX, y: view.bounds.midY)
        
        var perspective = CATransform3DIdentity
        perspective.m34 = -1 / 100
        layer.transform = perspective

        layer.addSublayer(openingCrawl.layer)
        view.layer.addSublayer(layer)
        
        let crawlTransformStart = CATransform3DMakeRotation(0.5, 1, 0, 0)
        openingCrawl.layer.transform = CATransform3DTranslate(crawlTransformStart, 0, 400, 0)
        
        let anim = CABasicAnimation(keyPath: "transform")
        anim.fromValue = openingCrawl.layer.transform

        let crawlTransformEnd = CATransform3DMakeRotation(0.5, 1, 0, 0)
        anim.toValue = CATransform3DTranslate(crawlTransformEnd, 0, -500, 0)

        anim.duration = 90
        openingCrawl.layer.add(anim, forKey: "transform")
    }
    
    
}

