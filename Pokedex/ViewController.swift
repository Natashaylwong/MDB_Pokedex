//
//  ViewController.swift
//  Pokedex
//
//  Created by SAMEER SURESH on 9/25/16.
//  Copyright © 2016 trainingprogram. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var inputPokemon: UITextField!
    
    var sliderValueAttack: UILabel!
    var sliderValueDefense: UILabel!
    var sliderValueHealth: UILabel!
    
    var attackSlider: UITextField!
    var healthSlider: UITextField!
    var defenseSlider: UITextField!
    
    var scView:UIScrollView!
    let buttonPadding:CGFloat = 10
    var xOffset:CGFloat = 10
    var filtered: Array<String>!
    var types = ["Bug", "Grass", "Dark", "Dragon","Electric", "Fairy", "Fighting", "Fire", "Flying", "Ghost", "Grass", "Ground", "Ice", "Normal", "Poison", "Physic", "Rock", "Steel", "Water"]


    override func viewDidLoad() {
        super.viewDidLoad()
        setupFilters()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func setupFilters() {
        
        scView = UIScrollView(frame: CGRect(x: 0, y: 120, width: view.bounds.width, height: 90))
        view.addSubview(scView)
        
        scView.backgroundColor = .white
        scView.translatesAutoresizingMaskIntoConstraints = false
        
        for i in 0 ... 17 {
            let button = UIButton()
            button.tag = i
            button.setImage(UIImage(named: "\(i).png"), for: .normal)
            button.addTarget(self, action: #selector(typeButtonTouched), for: UIControlEvents.touchUpInside)
            
            button.frame = CGRect(x: xOffset, y: CGFloat(buttonPadding), width: 70, height: 70)
            
            xOffset = xOffset + CGFloat(buttonPadding) + button.frame.size.width
            scView.addSubview(button)
        }
        scView.contentSize = CGSize(width: xOffset, height: scView.frame.height)
        
        
        
        

    }
    
    func typeButtonTouched(sender: UIButton) {
        filtered.append(types[sender.tag])
        sender.layer.borderWidth = 1
        sender.layer.borderColor = UIColor.black.cgColor
        
        print(filtered)
    }

}

