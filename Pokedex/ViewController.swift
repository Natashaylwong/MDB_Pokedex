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
    var titlePokedex: UILabel!
    
    var sliderValueAttack: UILabel!
    var sliderValueDefense: UILabel!
    var sliderValueHealth: UILabel!
    
    var attackInput: UITextField!
    var healthInput: UITextField!
    var defenseInput: UITextField!
    
    var namePokemon: String!
    var pokemonSearch: UITextField!
    var searchButton: UIButton!
    var randomButton: UIButton!
    var favoritesButton: UIButton!
    
    var scView:UIScrollView!
    let buttonPadding:CGFloat = 10
    var xOffset:CGFloat = 10
    var filteredType = Set<Int>()
    
    var attack: Int!
    var health: Int!
    var defense: Int!
    
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
        
        scView = UIScrollView(frame: CGRect(x: 0, y: 170, width: view.bounds.width, height: 110))
        view.addSubview(scView)
        
   //     scView.backgroundColor = .white
//        scView.layer.borderColor = UIColor.red.cgColor
//        scView.layer.borderWidth = 2
//        scView.alpha = 0.7
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
        
        titlePokedex = UILabel(frame: CGRect(x: 0, y: 20, width: view.frame.width, height: 60))
        titlePokedex.font = UIFont(name: "Pokemon Solid", size: 30)
        titlePokedex.backgroundColor = .red
        titlePokedex.alpha = 0.7
        titlePokedex.textColor = .white
        titlePokedex.textAlignment = .center
        titlePokedex.text = "Pokedex"
        view.addSubview(titlePokedex)
        
        pokemonSearch = UITextField(frame: CGRect(x: 10, y: 110, width: view.frame.width-150, height: 30))
        pokemonSearch.font = UIFont(name: "Pokemon Classic", size: 13)
        pokemonSearch.placeholder = "Search Pokemon"
        pokemonSearch.borderStyle = .roundedRect
        pokemonSearch.addTarget(self, action: #selector(pokemonSearchText), for: .editingDidEnd)
        view.addSubview(pokemonSearch)
        
        searchButton = UIButton(frame: CGRect(x: 260, y: 110, width: 100, height: 30))
        searchButton.backgroundColor = .red
        searchButton.titleLabel?.font = UIFont(name: "Pokemon Classic", size: 13)!
        searchButton.setTitle("Find", for: .normal)
        searchButton.setTitleColor(.white, for: .normal)
        searchButton.layer.cornerRadius = 5
        searchButton.alpha = 0.7
        searchButton.clipsToBounds = true
      //  searchButton.addTarget(self, action: #selector(searchButtonTapped), for: .touchUpInside)
        view.addSubview(searchButton)
        
        randomButton = UIButton(frame: CGRect(x: 30, y: 600, width: 150, height: 30))
        randomButton.backgroundColor = .red
        randomButton.titleLabel?.font = UIFont(name: "Pokemon Classic", size: 13)!
        randomButton.setTitle("20 Random", for: .normal)
        randomButton.setTitleColor(.white, for: .normal)
        randomButton.layer.cornerRadius = 5
        randomButton.alpha = 0.7
        randomButton.clipsToBounds = true
       // randomButton.addTarget(self, action: #selector(randomButtonTapped), for: .touchUpInside)
        view.addSubview(randomButton)
        
        favoritesButton = UIButton(frame: CGRect(x: 200, y: 600, width: 150, height: 30))
        favoritesButton.backgroundColor = .red
        favoritesButton.titleLabel?.font = UIFont(name: "Pokemon Classic", size: 13)!
        favoritesButton.setTitle("My Favorites", for: .normal)
        favoritesButton.setTitleColor(.white, for: .normal)
        favoritesButton.layer.cornerRadius = 5
        favoritesButton.alpha = 0.7
        favoritesButton.clipsToBounds = true
      //  favoritesButton.addTarget(self, action: #selector(favoritesButtonTapped), for: .touchUpInside)
        view.addSubview(favoritesButton)
        
        
        
        attackInput = UITextField(frame: CGRect(x: 60, y: 370, width: view.frame.width-120, height: 50))
        attackInput.font = UIFont(name: "Pokemon Classic", size: 13)
        attackInput.placeholder = "Minimum Attack Points"
        attackInput.borderStyle = .roundedRect
        attackInput.addTarget(self, action: #selector(attackText), for: .editingDidEnd)
        view.addSubview(attackInput)

        healthInput = UITextField(frame: CGRect(x: 60, y: 440, width: view.frame.width-120, height: 50))
        healthInput.font = UIFont(name: "Pokemon Classic", size: 13)
        healthInput.placeholder = "Minimum Health Points"
        healthInput.borderStyle = .roundedRect
        healthInput.addTarget(self, action: #selector(healthText), for: .editingDidEnd)
        view.addSubview(healthInput)
        
        defenseInput = UITextField(frame: CGRect(x: 60, y: 510, width: view.frame.width-120, height: 50))
        defenseInput.font = UIFont(name: "Pokemon Classic", size: 13)
        defenseInput.placeholder = "Minimum Defense Points"
        defenseInput.borderStyle = .roundedRect
        defenseInput.addTarget(self, action: #selector(defenseText), for: .editingDidEnd)
        view.addSubview(defenseInput)

    }
    
    func attackText(sender: UITextField) {
        attack = Int(sender.text!)
        print(attack)
    }
    
    func healthText(sender:UITextField) {
        health = Int(sender.text!)
        print(health)
    }
    func defenseText(sender: UITextField) {
        defense = Int(sender.text!)
        print(defense)
    }
    
    func pokemonSearchText (sender: UITextField) {
         namePokemon = sender.text
        print(namePokemon)
      // performSegue(withIdentifier: "toStats", sender: self)
    }
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "toStats" {
//            let answer = segue.destination as! StatsViewController
//            answer.lastAnswers = lastThreeQuestions
//            answer.lastPeople = lastThreePeople
//            answer.longestStreak = bestStreak
//        }
    
//    func favoritesButtonTapped (sender: UIButton) {
//        performSegue(withIdentifier: "toStats", sender: self)
//    }
//
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

