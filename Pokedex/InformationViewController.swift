//
//  InformationViewController.swift
//  Pokedex
//
//  Created by Natasha Wong on 2/16/18.
//  Copyright © 2018 trainingprogram. All rights reserved.
//

import UIKit

class InformationViewController: UIViewController {

    var icon: UIImageView!
    var heart: UIBarButtonItem!
    var iconButton: UIButton!
    var heartButton: UIButton!
    
    var favPokemon: Set<Int>!
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
    var types = ["Bug", "Grass", "Dark", "Dragon","Electric", "Fairy", "Fighting", "Fire", "Flying", "Ghost", "Grass", "Ground", "Ice", "Normal", "Poison", "Physic", "Rock", "Steel", "Water"]
    var typeSentence: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if pokemon.fav {
            heart.tintColor = .red
        } else {
            heart.tintColor = .clear
        }
    }

    func setupLayout() {
        navigationController?.navigationBar.tintColor = UIColor.white;

        self.navigationController?.navigationBar.alpha = 0.3
//        icon.image = UIImage(named: "heart.png")
//        icon.contentMode = .scaleAspectFit // set imageview's content mode
//        self.navigationController?.navigationBar. = icon
        heart = UIBarButtonItem(image: UIImage(named: "heart.png"), style: .plain, target: self, action: Selector(("heartPressed")))
        let internet = UIBarButtonItem(image: UIImage(named: "info.png"), style: .plain, target: self, action: Selector(("infoPressed")))
        self.navigationItem.rightBarButtonItem = heart
        self.navigationItem.leftBarButtonItem = internet
        
        iconButton = UIButton(frame: CGRect(x: 20, y: 600, width: 30, height: 30))
        iconButton.setImage(UIImage(named: "info"), for: .normal)
        iconButton.addTarget(self, action: #selector(infoPressed), for: .touchUpInside)
        view.addSubview(iconButton)
        
        heartButton = UIButton(frame: CGRect(x: 400, y: 60, width: 30, height: 30))
        heartButton.setImage(UIImage(named: "heart"), for: .normal)
        iconButton.addTarget(self, action: #selector(heartPressed), for: .touchUpInside)
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
        
        pokemonAttack = UILabel(frame: CGRect(x: 160, y: 170, width: 190, height: 15))
        pokemonAttack.font = UIFont(name: "Pokemon Classic", size: 10)
        pokemonAttack.backgroundColor = .red
        pokemonAttack.textColor = .white
        pokemonAttack.text = "Pokemon Attack: \(pokemon.attack!)"
        view.addSubview(pokemonAttack)
//
        pokemonDefense = UILabel(frame: CGRect(x: 160, y: 190, width: 190, height: 15))
        pokemonDefense.font = UIFont(name: "Pokemon Classic", size: 10)
        pokemonDefense.backgroundColor = .red
        pokemonDefense.textColor = .white
        // pokemonDefense.textAlignment = .center
        pokemonDefense.text = "Pokemon Defense: \(pokemon.defense!)"
        view.addSubview(pokemonDefense)
//
        pokemonHealth = UILabel(frame: CGRect(x: 160, y: 210, width: 190, height: 15))
        pokemonHealth.font = UIFont(name: "Pokemon Classic", size: 10)
        pokemonHealth.backgroundColor = .red
        pokemonHealth.textColor = .white
        // pokemonDefense.textAlignment = .center
        pokemonHealth.text = "Pokemon Health: \(pokemon.health!)"
        view.addSubview(pokemonHealth)
//
        pokemonSpecialAttack = UILabel(frame: CGRect(x: 160, y: 230, width: 190, height: 15))
        pokemonSpecialAttack.font = UIFont(name: "Pokemon Classic", size: 10)
        pokemonSpecialAttack.backgroundColor = .red
        pokemonSpecialAttack.textColor = .white
        // pokemonDefense.textAlignment = .center
        pokemonSpecialAttack.text = "Special Attack: \(pokemon.specialAttack!)"
        view.addSubview(pokemonSpecialAttack)
//
        pokemonSpecialDefense = UILabel(frame: CGRect(x: 160, y: 250, width: 190, height: 15))
        pokemonSpecialDefense.font = UIFont(name: "Pokemon Classic", size: 10)
        pokemonSpecialDefense.backgroundColor = .red
        pokemonSpecialDefense.textColor = .white
        // pokemonDefense.textAlignment = .center
        pokemonSpecialDefense.text = "Special Defense: \(pokemon.specialDefense!)"
        view.addSubview(pokemonSpecialDefense)
//
        pokemonSpecies = UILabel(frame: CGRect(x: 160, y: 270, width: 190, height: 15))
        pokemonSpecies.font = UIFont(name: "Pokemon Classic", size: 10)
        pokemonSpecies.backgroundColor = .red
        pokemonSpecies.textColor = .white
        // pokemonDefense.textAlignment = .center
        pokemonSpecies.text = "Pokemon Species: \(pokemon.species!)"
        view.addSubview(pokemonSpecies)
//
        pokemonSpeed = UILabel(frame: CGRect(x: 160, y: 290, width: 190, height: 15))
        pokemonSpeed.font = UIFont(name: "Pokemon Classic", size: 10)
        pokemonSpeed.backgroundColor = .red
        pokemonSpeed.textColor = .white
        // pokemonDefense.textAlignment = .center
        pokemonSpeed.text = "Pokemon Speed: \(pokemon.speed!)"
        view.addSubview(pokemonSpeed)
//
        pokemonTotal = UILabel(frame: CGRect(x: 160, y: 310, width: 190, height: 15))
        pokemonTotal.font = UIFont(name: "Pokemon Classic", size: 10)
        pokemonTotal.backgroundColor = .red
        pokemonTotal.textColor = .white
        // pokemonDefense.textAlignment = .center
        pokemonTotal.text = "Pokemon Total: \(pokemon.total!)"
        view.addSubview(pokemonTotal)
//
        pokemonTypes = UILabel(frame: CGRect(x: 160, y: 330, width: 190, height: 15))
        pokemonTypes.font = UIFont(name: "Pokemon Classic", size: 10)
        pokemonTypes.backgroundColor = .red
        pokemonTypes.textColor = .white
        // pokemonDefense.textAlignment = .center
        pokemonTypes.text = "Pokemon Types: \(pokemon.types)"
        view.addSubview(pokemonTypes)
    }
    
    func heartPressed(sender: UIButton!) {
        if pokemon.fav {
            pokemon.fav = false
            heart.tintColor = .clear
            ViewController.favPokemon.remove(at: <#T##Int#>)
        } else {
            pokemon.fav = true
            heart.tintColor = .red
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


