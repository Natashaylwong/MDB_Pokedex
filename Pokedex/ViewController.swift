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
    var titlePokedex: UITextView!
    
    var sliderValueAttack: UILabel!
    var sliderValueDefense: UILabel!
    var sliderValueHealth: UILabel!
    
    var attackInput: UITextField!
    var healthInput: UITextField!
    var defenseInput: UITextField!
    
    var pokemonSearch: UITextField!
    var searchButton: UIButton!
    
    var scView:UIScrollView!
    let buttonPadding:CGFloat = 10
    var xOffset:CGFloat = 10
    var filteredType = Set<Int>()
    var filteredValues = [Int]()
    var types = ["Bug", "Grass", "Dark", "Dragon","Electric", "Fairy", "Fighting", "Fire", "Flying", "Ghost", "Grass", "Ground", "Ice", "Normal", "Poison", "Physic", "Rock", "Steel", "Water"]


    override func viewDidLoad() {
        super.viewDidLoad()
        setupFilters()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func setupFilters() {
        
        let width = UIScreen.main.bounds.size.width
        let height = UIScreen.main.bounds.size.height
        
        let imageViewBackground = UIImageView(frame: CGRect(x: 0, y: 0, width: width, height: height))
        imageViewBackground.image = UIImage(named: "Pokeball")
        
        // you can change the content mode:
        imageViewBackground.contentMode = UIViewContentMode.scaleAspectFill
        imageViewBackground.alpha = 0.5
        
        view.addSubview(imageViewBackground)
        
        scView = UIScrollView(frame: CGRect(x: 0, y: 150, width: view.bounds.width, height: 110))
        view.addSubview(scView)
        
   //     scView.backgroundColor = .white
        scView.translatesAutoresizingMaskIntoConstraints = false
        
        for i in 0 ... 17 {
            let button = UIButton()
            button.tag = i
            button.setImage(UIImage(named: "\(i).png"), for: .normal)
            button.addTarget(self, action: #selector(typeButtonTouched), for: UIControlEvents.touchUpInside)
            
            button.frame = CGRect(x: xOffset, y: CGFloat(buttonPadding), width: 80, height: 100)
            
            xOffset = xOffset + CGFloat(buttonPadding) + button.frame.size.width
            scView.addSubview(button)
        }
        scView.contentSize = CGSize(width: xOffset, height: scView.frame.height)
        
        titlePokedex = UITextView(frame: CGRect(x: 0, y: 20, width: view.frame.width, height: 60))
        titlePokedex.font = UIFont(name: "Pokemon Solid", size: 30)
        titlePokedex.backgroundColor = .red
        titlePokedex.alpha = 0.7
        titlePokedex.textColor = .white
        titlePokedex.textAlignment = .center
        titlePokedex.text = "Pokedex"
        view.addSubview(titlePokedex)
        
        pokemonSearch = UITextField(frame: CGRect(x: 10, y: 98, width: view.frame.width-150, height: 30))
        pokemonSearch.font = UIFont(name: "Pokemon Classic", size: 13)
        pokemonSearch.placeholder = "Search Pokemon"
        pokemonSearch.borderStyle = .roundedRect
        view.addSubview(pokemonSearch)
        
        searchButton = UIButton(frame: CGRect(x: 10, y: 98, width: 100, height: 30))
        searchButton.backgroundColor = .white
        searchButton.setTitle("Find", for: .normal)
        searchButton.layer.cornerRadius = 5
        searchButton.clipsToBounds = true
        view.addSubview(searchButton)
        
        attackInput = UITextField(frame: CGRect(x: 60, y: 400, width: view.frame.width-120, height: 50))
        attackInput.font = UIFont(name: "Pokemon Classic", size: 13)
        attackInput.placeholder = "Minimum Attack Points"
        attackInput.borderStyle = .roundedRect
        view.addSubview(attackInput)

        healthInput = UITextField(frame: CGRect(x: 60, y: 470, width: view.frame.width-120, height: 50))
        healthInput.font = UIFont(name: "Pokemon Classic", size: 13)
        healthInput.placeholder = "Minimum Health Points"
        healthInput.borderStyle = .roundedRect
        view.addSubview(healthInput)
        
        defenseInput = UITextField(frame: CGRect(x: 60, y: 540, width: view.frame.width-120, height: 50))
        defenseInput.font = UIFont(name: "Pokemon Classic", size: 13)
        defenseInput.placeholder = "Minimum Defense Points"
        defenseInput.borderStyle = .roundedRect
        view.addSubview(defenseInput)

    }
    
    func typeButtonTouched(sender: UIButton) {
        if (filteredType.contains(sender.tag)){
            filteredType.remove(sender.tag)
            sender.layer.borderWidth = 2
            sender.layer.borderColor = UIColor.white.cgColor
            print(filteredType)
        } else {
            filteredType.insert(sender.tag)
            sender.layer.borderWidth = 2
            sender.layer.borderColor = UIColor.red.cgColor
            print(filteredType)
        }
    }

}

