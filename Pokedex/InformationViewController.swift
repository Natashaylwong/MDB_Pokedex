//
//  InformationViewController.swift
//  Pokedex
//
//  Created by Natasha Wong on 2/16/18.
//  Copyright © 2018 trainingprogram. All rights reserved.
//

import UIKit
import SafariServices

class InformationViewController: UIViewController {

//    var icon: UIImageView!
//    var heart: UIBarButtonItem!
    var typesImage: UIImageView!
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
    
    var internetLabel: UILabel!
    var favoritesLabel: UILabel!
    
    var types = ["Bug", "Dark", "Dragon","Electric", "Fairy", "Fighting", "Fire", "Flying", "Ghost", "Grass", "Ground", "Ice", "Normal", "Poison", "Physic", "Rock", "Steel", "Water"]
    var typeSentence: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if pokemon.fav {
            heartButton.tintColor = .red
        } else {
            heartButton.tintColor = .white
        }
    }

    func setupLayout() {
        navigationController?.navigationBar.tintColor = UIColor.white;
        
        iconButton = UIButton(frame: CGRect(x: 10, y: 620, width: 30, height: 30))
        iconButton.setImage(UIImage(named: "info"), for: .normal)
        iconButton.addTarget(self, action: #selector(infoPressed), for: .touchUpInside)
        view.addSubview(iconButton)
        
        heartButton = UIButton(frame: CGRect(x: 335, y: 620, width: 30, height: 30))
        heartButton.setImage(UIImage(named: "heart"), for: .normal)
        iconButton.addTarget(self, action: #selector(heartPressed), for: .touchUpInside)
        view.addSubview(heartButton)
        
        favoritesLabel = UILabel(frame: CGRect(x: 160, y: 620, width: 200, height: 40))
        favoritesLabel.font = UIFont(name: "Pokemon Classic", size: 10)
        favoritesLabel.textColor = .black
        favoritesLabel.text = "Add to Favorites"
        favoritesLabel.textAlignment = .center
        view.addSubview(favoritesLabel)
        
        internetLabel = UILabel(frame: CGRect(x: 50, y: 620, width: 120, height: 40))
        internetLabel.font = UIFont(name: "Pokemon Classic", size: 10)
        internetLabel.textColor = .black
        internetLabel.text = "Search on Web"
        internetLabel.textAlignment = .center
        view.addSubview(internetLabel)
        
        pokemonImage = UIImageView(frame: CGRect(x: 60, y: 200, width: view.frame.width - 120, height: 200))
        checkImage()
        view.addSubview(pokemonImage)
        
        pokemonName = UILabel(frame: CGRect(x: 30, y: 100, width: view.frame.width-60, height: 40))
        pokemonName.font = UIFont(name: "Pokemon Solid", size: 25)
        pokemonName.backgroundColor = .red
       // pokemonName.alpha = 0.7
        pokemonName.textColor = .white
        pokemonName.textAlignment = .center
        pokemonName.text = "# \(pokemon.number!) \(pokemon.name!)"
        view.addSubview(pokemonName)
        
        pokemonAttack = UILabel(frame: CGRect(x: 30, y: 170, width: 100, height: 20))
        pokemonAttack.font = UIFont(name: "Pokemon Classic", size: 9)
        pokemonAttack.backgroundColor = UIColor(red: 1, green: 0.7216, blue: 0.5098, alpha: 1.0)
        pokemonAttack.textColor = .black
        pokemonAttack.text = "Attack: \(pokemon.attack!)"
        pokemonAttack.textAlignment = .center
        view.addSubview(pokemonAttack)
//
        pokemonDefense = UILabel(frame: CGRect(x: 140, y: 170, width: 100, height: 20))
        pokemonDefense.font = UIFont(name: "Pokemon Classic", size: 9)
        pokemonDefense.backgroundColor = UIColor(red: 1, green: 1, blue: 0.5098, alpha: 1.0)
        pokemonDefense.textColor = .black
        pokemonDefense.textAlignment = .center
        pokemonDefense.text = "Defense: \(pokemon.defense!)"
        view.addSubview(pokemonDefense)
//
        pokemonHealth = UILabel(frame: CGRect(x: 250, y: 170, width: 100, height: 20))
        pokemonHealth.font = UIFont(name: "Pokemon Classic", size: 9)
        pokemonHealth.backgroundColor = UIColor(red: 0.5765, green: 0.9882, blue: 0.502, alpha: 1.0)
        pokemonHealth.textColor = .black
        pokemonHealth.textAlignment = .center
        pokemonHealth.text = "HP: \(pokemon.health!)"
        view.addSubview(pokemonHealth)
//
        pokemonSpecialAttack = UILabel(frame: CGRect(x: 30, y: 470, width: 100, height: 20))
        pokemonSpecialAttack.font = UIFont(name: "Pokemon Classic", size: 9)
        pokemonSpecialAttack.backgroundColor = UIColor(red: 0.5647, green: 0.4941, blue: 0.9686, alpha: 1.0)
        pokemonSpecialAttack.textColor = .black
        pokemonSpecialAttack.textAlignment = .center
        pokemonSpecialAttack.text = "spAtt: \(pokemon.specialAttack!)"
        view.addSubview(pokemonSpecialAttack)
//
        pokemonSpecialDefense = UILabel(frame: CGRect(x: 140, y: 470, width: 100, height: 20))
        pokemonSpecialDefense.font = UIFont(name: "Pokemon Classic", size: 9)
        pokemonSpecialDefense.backgroundColor = UIColor(red: 0.5098, green: 1, blue: 0.8275, alpha: 1.0)
        pokemonSpecialDefense.textColor = .black
        pokemonSpecialDefense.textAlignment = .center
        pokemonSpecialDefense.text = "spDef: \(pokemon.specialDefense!)"
        view.addSubview(pokemonSpecialDefense)
        
        pokemonSpeed = UILabel(frame: CGRect(x: 250, y: 470, width: 100, height: 20))
        pokemonSpeed.font = UIFont(name: "Pokemon Classic", size: 9)
        pokemonSpeed.backgroundColor = UIColor(red: 1, green: 0.5098, blue: 0.7608, alpha: 1.0)
        pokemonSpeed.textColor = .black
        pokemonSpeed.textAlignment = .center
        pokemonSpeed.text = "Speed: \(pokemon.speed!)"
        view.addSubview(pokemonSpeed)

        pokemonSpecies = UILabel(frame: CGRect(x: 20, y: 510, width: view.frame.width-40, height: 30))
        pokemonSpecies.font = UIFont(name: "Pokemon Classic", size: 10)
        //pokemonSpecies.backgroundColor = .red
        pokemonSpecies.textColor = .black
        pokemonSpecies.textAlignment = .center
        pokemonSpecies.text = "Species: \(pokemon.species!)"
        view.addSubview(pokemonSpecies)

        pokemonTotal = UILabel(frame: CGRect(x: 60, y: 425, width: view.frame.width-120, height: 30))
        pokemonTotal.font = UIFont(name: "Pokemon Classic", size: 12)
        pokemonTotal.textColor = .black
        pokemonTotal.textAlignment = .center
        pokemonTotal.text = "Total: \(pokemon.total!)"
        view.addSubview(pokemonTotal)
        
        pokemonTypes = UILabel(frame: CGRect(x: 30, y: 550, width: view.frame.width-60, height: 40))
        pokemonTypes.font = UIFont(name: "Pokemon Classic", size: 10)
        pokemonTypes.textColor = .black
        pokemonTypes.textAlignment = .center
        pokemonTypes.text = "Type: \(pokemon.types)"
        view.addSubview(pokemonTypes)
    }
    
    
    
    @objc func heartPressed(sender: UIButton!) {
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
            heartButton.tintColor = .white
        } else {
            pokemon.fav = true
            heartButton.tintColor = .red
            ViewController.favPokemon.append(pokemon)
        }
    }
    @objc func infoPressed(sender: UIButton!) {
        if let url = URL(string: "https://google.com/search?q=\(pokemon.name!)") {
            let vc = SFSafariViewController(url: url, entersReaderIfAvailable: true)
            present(vc, animated: true)
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


