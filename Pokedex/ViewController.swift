//
//  ViewController.swift
//  Pokedex
//
//  Created by SAMEER SURESH on 9/25/16.
//  Copyright © 2016 trainingprogram. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var scView:UIScrollView!
    let buttonPadding:CGFloat = 10
    var xOffset:CGFloat = 10


    override func viewDidLoad() {
        super.viewDidLoad()
        setupFilters()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func setupFilters() {
        scView = UIScrollView(frame: CGRect(x: 0, y: 120, width: view.bounds.width, height: 50))
        view.addSubview(scView)
        
        scView.backgroundColor = UIColor.blue
        scView.translatesAutoresizingMaskIntoConstraints = false
        
        for i in 0 ... 10 {
            let button = UIButton()
            button.tag = i
            button.backgroundColor = UIColor.darkGray
            button.setTitle("/(i)", for: .normal)
            //button.addTarget(self, action: #selector(btnTouch), for: UIControlEvents.touchUpInside)
            
            button.frame = CGRect(x: xOffset, y: CGFloat(buttonPadding), width: 70, height: 30)
            
            xOffset = xOffset + CGFloat(buttonPadding) + button.frame.size.width
            scView.addSubview(button)
            
            
        }
        
        scView.contentSize = CGSize(width: xOffset, height: scView.frame.height)
    }
}

