//
//  InformationViewController.swift
//  Pokedex
//
//  Created by Natasha Wong on 2/16/18.
//  Copyright © 2018 trainingprogram. All rights reserved.
//

import UIKit

class InformationViewController: UIViewController {

//    var icon: UIImageView!
//    var heart: UIBarButtonItem!
    var iconButton: UIButton!
    var heartButton: UIButton!
    var pokemon: Pokemon!
    var pokemonImage: UIImageView!
    var pokemonName: UILabel!
    var pokemonNumber: UILabel!
    var pokemonAttack: UILabel!
    var pokemonDefense: UILabel!
    var pokemonHealth: UILabel!
    var pokemonSpecialAttack: UILabel!
    var pokemonSpecialDefense: UILabel!
    var pokemonSpecies: UILabel!
    var pokemonSpeed: UILabel!
    var pokemonTotal: UILabel!
    var pokemonTypes: UILabel!
    var types = ["Bug", "Dark", "Dragon","Electric", "Fairy", "Fighting", "Fire", "Flying", "Ghost", "Grass", "Ground", "Ice", "Normal", "Poison", "Physic", "Rock", "Steel", "Water"]
    var typeSentence: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if pokemon.fav {
            heartButton.setImage(UIImage(named: "heart1"), for: .normal)
        } else {
            heartButton.setImage(UIImage(named: "heart"), for: .normal)
        }
    }

    func setupLayout() {
        navigationController?.navigationBar.tintColor = UIColor.white;

        self.navigationController?.navigationBar.alpha = 0.3
//        icon.image = UIImage(named: "heart.png")
//        icon.contentMode = .scaleAspectFit // set imageview's content mode
//        self.navigationController?.navigationBar. = icon
//        heart = UIBarButtonItem(image: UIImage(named: "heart.png"), style: .plain, target: self, action: Selector(("heartPressed")))
//        let internet = UIBarButtonItem(image: UIImage(named: "info.png"), style: .plain, target: self, action: Selector(("infoPressed")))
//        self.navigationItem.rightBarButtonItem = heart
//        self.navigationItem.leftBarButtonItem = internet
        
        iconButton = UIButton(frame: CGRect(x: 20, y: 600, width: 30, height: 30))
        iconButton.setImage(UIImage(named: "info"), for: .normal)
        iconButton.addTarget(self, action: #selector(infoPressed), for: .touchUpInside)
        view.addSubview(iconButton)
        
        heartButton = UIButton(frame: CGRect(x: 300, y: 60, width: 30, height: 30))
        heartButton.setImage(UIImage(named: "heart"), for: .normal)
        heartButton.addTarget(self, action: #selector(heartPressed), for: .touchUpInside)
        view.addSubview(heartButton)
        
        pokemonImage = UIImageView(frame: CGRect(x: 0, y: 300, width: view.frame.width - 120, height: 200))
        checkImage()
        view.addSubview(pokemonImage)
        
        pokemonName = UILabel(frame: CGRect(x: 30, y: 100, width: view.frame.width-60, height: 40))
        pokemonName.font = UIFont(name: "Pokemon Solid", size: 25)
        pokemonName.backgroundColor = .red
       // pokemonName.alpha = 0.7
        pokemonName.textColor = .white
        pokemonName.textAlignment = .center
        pokemonName.text = "#\(pokemon.number!) \(pokemon.name!)"
        view.addSubview(pokemonName)
        
        pokemonAttack = UILabel(frame: CGRect(x: 160, y: 170, width: 200, height: 15))
        pokemonAttack.font = UIFont(name: "Pokemon Classic", size: 10)
        pokemonAttack.backgroundColor = .red
        pokemonAttack.textColor = .white
        pokemonAttack.text = "Pokemon Attack: \(pokemon.attack!)"
        view.addSubview(pokemonAttack)
//
        pokemonDefense = UILabel(frame: CGRect(x: 160, y: 190, width: 200, height: 15))
        pokemonDefense.font = UIFont(name: "Pokemon Classic", size: 10)
        pokemonDefense.backgroundColor = .red
        pokemonDefense.textColor = .white
        // pokemonDefense.textAlignment = .center
        pokemonDefense.text = "Pokemon Defense: \(pokemon.defense!)"
        view.addSubview(pokemonDefense)
//
//        pokemonHealth = UILabel(frame: CGRect(x: 0, y: 20, width: 200, height: 50))
//        pokemonHealth.font = UIFont(name: "Pokemon Classic", size: 12)
//        pokemonHealth.backgroundColor = .red
//        pokemonHealth.alpha = 0.5
//        pokemonHealth.textColor = .white
//        // pokemonDefense.textAlignment = .center
//        pokemonDefense.text = "Pokemon Health: \(pokemon.health)"
//        view.addSubview(pokemonHealth)
//
//        pokemonSpecialAttack = UILabel(frame: CGRect(x: 420, y: 20, width: 200, height: 50))
//        pokemonSpecialAttack.font = UIFont(name: "Pokemon Classic", size: 12)
//        pokemonSpecialAttack.backgroundColor = .red
//        pokemonSpecialAttack.alpha = 0.5
//        pokemonSpecialAttack.textColor = .white
//        // pokemonDefense.textAlignment = .center
//        pokemonSpecialAttack.text = "Pokemon Special Attack: \(pokemon.specialAttack)"
//        view.addSubview(pokemonSpecialAttack)
//
//        pokemonSpecialDefense = UILabel(frame: CGRect(x: 480, y: 20, width: 200, height: 50))
//        pokemonSpecialDefense.font = UIFont(name: "Pokemon Classic", size: 12)
//        pokemonSpecialDefense.backgroundColor = .red
//        pokemonSpecialDefense.alpha = 0.5
//        pokemonSpecialDefense.textColor = .white
//        // pokemonDefense.textAlignment = .center
//        pokemonSpecialAttack.text = "Pokemon Special Defense: \(pokemon.specialAttack)"
//        view.addSubview(pokemonSpecialDefense)
//
//        pokemonSpecies = UILabel(frame: CGRect(x: 520, y: 20, width: 200, height: 50))
//        pokemonSpecies.font = UIFont(name: "Pokemon Classic", size: 12)
//        pokemonSpecies.backgroundColor = .red
//        pokemonSpecies.alpha = 0.5
//        pokemonSpecies.textColor = .white
//        // pokemonDefense.textAlignment = .center
//        pokemonSpecialAttack.text = "Pokemon Species: \(pokemon.species)"
//        view.addSubview(pokemonSpecies)
//
//        pokemonSpeed = UILabel(frame: CGRect(x: 580, y: 20, width: 200, height: 50))
//        pokemonSpeed.font = UIFont(name: "Pokemon Classic", size: 12)
//        pokemonSpeed.backgroundColor = .red
//        pokemonSpeed.alpha = 0.5
//        pokemonSpeed.textColor = .white
//        // pokemonDefense.textAlignment = .center
//        pokemonSpecialAttack.text = "Pokemon Speed: \(pokemon.speed)"
//        view.addSubview(pokemonSpecies)
//
//        pokemonTotal = UILabel(frame: CGRect(x: 620, y: 20, width: 200, height: 50))
//        pokemonTotal.font = UIFont(name: "Pokemon Classic", size: 12)
//        pokemonTotal.backgroundColor = .red
//        pokemonTotal.alpha = 0.5
//        pokemonTotal.textColor = .white
//        // pokemonDefense.textAlignment = .center
//        pokemonSpecialAttack.text = "Pokemon Total: \(pokemon.total)"
//        view.addSubview(pokemonTotal)
//
//        pokemonTypes = UILabel(frame: CGRect(x: 620, y: 20, width: 200, height: 50))
//        pokemonTypes.font = UIFont(name: "Pokemon Classic", size: 12)
//        pokemonTypes.backgroundColor = .red
//        pokemonTypes.alpha = 0.5
//        pokemonTypes.textColor = .white
//        // pokemonDefense.textAlignment = .center
//        pokemonTypes.text = "Pokemon Types: \(pokemon.types)"
//        view.addSubview(pokemonTypes)
    }
    
    @objc func heartPressed(sender: UIButton!) {
        print("pressed")
        if pokemon.fav {
            var i = 0
            while (i < ViewController.favPokemon.count) {
                let p = ViewController.favPokemon[i]
                if (p.name == pokemon.name) {
                    ViewController.favPokemon.remove(at: i)
                    break
                }
                i += 1
            }
            pokemon.fav = false
            heartButton.setImage(UIImage(named: "heart"), for: .normal)
        } else {
            pokemon.fav = true
            heartButton.setImage(UIImage(named: "heart1"), for: .normal)
            ViewController.favPokemon.append(pokemon)
        }
    }
    @objc func infoPressed(sender: UIButton!) {
        if let url = URL(string: "https://google.com/search?q=\(pokemon.name)") {
            UIApplication.shared.open(url, options: [:])
        }
    }
    
    func checkImage() {
        let url = URL(string: pokemon.imageUrl)
        if url != nil {
            do {
                let data = try Data(contentsOf: url!)
                pokemonImage.image = UIImage(data: data)
            } catch {
                pokemonImage.image = UIImage(named: "pokedex")
            }
        } else {
           pokemonImage.image = UIImage(named: "pokedex")
//            //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
        }
    }

}
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


