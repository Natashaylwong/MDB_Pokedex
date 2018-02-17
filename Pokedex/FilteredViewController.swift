
//
//  FilteredViewController.swift
//  Pokedex
//
//  Created by Natasha Wong on 2/15/18.
//  Copyright © 2018 trainingprogram. All rights reserved.
//

import UIKit

class FilteredViewController: UIViewController {
    var attack = 0
    var health = 0
    var defense = 0
    var favPokemon: Array<Pokemon> = []
    var favPressed: Bool = false
    var randomPokemon = Set<Int>()
    var namePokemon: String!
    var pokemon: Pokemon!
    
    var types = Set<Int>()
    var getTypes = Set<String>()
    
    var gridView: UICollectionView!
    var listView: UITableView!
    var pokemonArray = [Pokemon]()
    var getfilteredPokemon = Array<Pokemon>()
    var numOfPokemon: Int = 800
    var pokemonTypes = ["Bug", "Dark", "Dragon", "Electric", "Fairy", "Fighting", "Fire", "Flying", "Ghost", "Grass", "Ground", "Ice", "Normal", "Poison", "Physic", "Rock", "Steel", "Water"]

    override func viewDidLoad() {
        super.viewDidLoad()
        setupListView()
        setupGridView()
        settingSC()
        filtering()
        gridView.reloadData()
        listView.reloadData()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
    }
    
    func setupListView() {
        listView = UITableView(frame: view.frame)
        listView.register(PokemonViewCell2.self, forCellReuseIdentifier: "pokemonCell2")
        listView.backgroundColor = UIColor.white
        listView.rowHeight = 80
        listView.showsVerticalScrollIndicator = true
        listView.bounces = true
        listView.tag = 1
        listView.delegate = self
        listView.dataSource = self
        view.addSubview(listView)
    }
    
    func filtering() {
        print(namePokemon)
        if !randomPokemon.isEmpty {
            //Have an array list of numbers that you want to use to find the index of the pokemon
            for i in pokemonArray {
                for j in randomPokemon {
                    if i.number == j {
                        getfilteredPokemon.append(i)
                    }
                }
                
            }
        }
        else if favPressed {
            for i in favPokemon {
                getfilteredPokemon.append(i)
            }
        }
        else if namePokemon != nil || namePokemon != "" {
            for i in pokemonArray {
                if (i.name == namePokemon) {
                    getfilteredPokemon.append(i)
                    print(getfilteredPokemon[0])
                }
            }
        } else if attack == 0 && defense == 0 && health == 0  && types.isEmpty {
            for i in pokemonArray {
                getfilteredPokemon.append(i)
            }
        } else {
            for i in pokemonArray {
                if types.isEmpty {
                    if i.attack >= attack && i.defense >= defense && i.health >= health {
                        print(attack)
                        print(defense)
                        print(health)
                        getfilteredPokemon.append(i)
                    }
                } else {
                    for j in types {
                        getTypes.insert(pokemonTypes[j])
                    }
                    if i.attack >= attack && i.defense >= defense && i.health >= health {
                        let listSet = Set(i.types)
                        
                        let allElemsContained = getTypes.isSubset(of: listSet)
                        if allElemsContained {
                            getfilteredPokemon.append(i)
                        }
                    }
                }
            }
        }
        numOfPokemon = getfilteredPokemon.count
    }
    
    func setupGridView() {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 0
        gridView = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        gridView.register(PokemonViewCell.self, forCellWithReuseIdentifier: "pokemonCell")
        gridView.backgroundColor = UIColor.white
        gridView.tag = 0
        gridView.delegate = self
        gridView.dataSource = self
        view.addSubview(gridView)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "infoSegue" {
            let information = segue.destination as! InformationViewController
            information.pokemon = pokemon
        }
        
    }
    
    
    func settingSC() {
        navigationController?.navigationBar.barTintColor = UIColor.red
//        navigationController?.navigationBar.barTintColor?.withAlphaComponent(0.5)
        navigationController?.navigationBar.tintColor = UIColor.white;
//        self.navigationController?.navigationBar.alpha = 0.3
        let items = ["Grid", "List"]
        let customSC = UISegmentedControl(items: items)
        customSC.addTarget(self, action: #selector(switchingSC), for: .valueChanged)
        customSC.selectedSegmentIndex = 0
        gridView.isHidden = false
        listView.isHidden = true
//        switch customSC.selectedSegmentIndex {
//        case 0:
//            gridView.isHidden = false
//            listView.isHidden = true
//        case 1:
//            gridView.isHidden = true
//            listView.isHidden = false
//        default:
//            break
//        }
        
        // Set up Frame and SegmentedControl
//        customSC = UISegmentedControl(frame: CGRect(x: 30, y: 10, width: view.frame.width - 60, height: 40))
        
        // Style the Segmented Control
        customSC.sizeToFit()
        customSC.layer.cornerRadius = 5.0  // Don't let background bleed
        customSC.backgroundColor = .red
        customSC.tintColor = .white
        
        // Add target action method
        //  customSC.addTarget(self, action: Selector("______"), for: .valueChanged)
        
        // Add this custom Segmented Control to our view
        self.navigationItem.titleView = customSC
    }
    
    @objc func switchingSC(sender: UISegmentedControl!) {
        switch sender.selectedSegmentIndex {
            case 0:
                gridView.isHidden = false
                listView.isHidden = true
            case 1:
                gridView.isHidden = true
                listView.isHidden = false
            default:
                break
            }
    }
}
    
extension FilteredViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numOfPokemon
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "pokemonCell2", for: indexPath) as! PokemonViewCell2
        for subview in cell.contentView.subviews {
            subview.removeFromSuperview()
        }
        cell.awakeFromNib()
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let pokemonCell = cell as! PokemonViewCell2
        let pokemon = getfilteredPokemon[indexPath.item]
        let url = URL(string: pokemon.imageUrl)
        if url != nil {
            do {
                let data = try Data(contentsOf: url!)
                pokemonCell.pokemonImageView.image = UIImage(data: data)
                pokemonCell.cellLabel.text = "#\(pokemon.number!) \(pokemon.name!)"
                //                pokemonCell.cellButton.setTitle("#\(pokemon.number!) \(pokemon.name!)", for: .normal)
            } catch {
                print("No data")
                pokemonCell.pokemonImageView.image = UIImage(named: "pokedex")
                pokemonCell.cellLabel.text = "#\(pokemon.number!) \(pokemon.name!)"
                //                pokemonCell.cellButton.setTitle("#\(pokemon.number!) \(pokemon.name!)", for: .normal)
            }
        } else {
            print("Broken url")
            pokemonCell.pokemonImageView.image = UIImage(named: "pokedex")
            pokemonCell.cellLabel.text = "#\(pokemon.number!) \(pokemon.name!)"
            //            pokemonCell.cellButton.setTitle("#\(pokemon.number!) \(pokemon.name!)", for: .normal)
            //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        pokemon = getfilteredPokemon[indexPath.row]
        CellTapped()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //Specifying the number of sections in the collectionView
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    //Specifying the number of cells in the given section
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numOfPokemon
    }
    
    //We use this method to dequeue the cell and set it up
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "pokemonCell", for: indexPath) as! PokemonViewCell
        for subview in cell.contentView.subviews {
            subview.removeFromSuperview()
        }
        cell.awakeFromNib()
        cell.delegate = self
        return cell
    }
    
    //We use this method to populate the data of a given cell
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let pokemonCell = cell as! PokemonViewCell
        let pokemon = getfilteredPokemon[indexPath.item]
        let url = URL(string: pokemon.imageUrl)
        if url != nil {
            do {
                let data = try Data(contentsOf: url!)
                pokemonCell.pokemonImageView.image = UIImage(data: data)
                print(pokemon.number)
                pokemonCell.cellLabel.text = "#\(pokemon.number!) \(pokemon.name!)"
//                pokemonCell.cellButton.setTitle("#\(pokemon.number!) \(pokemon.name!)", for: .normal)
            } catch {
                print("No data")
                pokemonCell.pokemonImageView.image = UIImage(named: "pokedex")
                pokemonCell.cellLabel.text = "#\(pokemon.number!) \(pokemon.name!)"
//                pokemonCell.cellButton.setTitle("#\(pokemon.number!) \(pokemon.name!)", for: .normal)
            }
        } else {
            print("Broken url")
            pokemonCell.pokemonImageView.image = UIImage(named: "pokedex")
            pokemonCell.cellLabel.text = "#\(pokemon.number!) \(pokemon.name!)"
//            pokemonCell.cellButton.setTitle("#\(pokemon.number!) \(pokemon.name!)", for: .normal)
            //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
        }
    }
    
    //Sets the size of the cell
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (view.frame.width)/3.2, height: 120)
    }
    
    //If we want something to happen when the user taps a cell, then use this method
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.item)
        //Natasha's Changes
       // self.performSegue(withIdentifier: "infoSegue", sender: self)
        pokemon = getfilteredPokemon[indexPath.item]
        CellTapped()
    }
    
    func CellTapped() {
        self.performSegue(withIdentifier: "infoSegue", sender: self)
    }
    
}

extension FilteredViewController: PokemonViewCellDelegate, PokemonViewCell2Delegate {
    
    func listButton(forCell: PokemonViewCell2) {
        forCell.backgroundColor = UIColor.clear
    }
    
    func gridButton(forCell: PokemonViewCell) {
        forCell.backgroundColor = UIColor.clear
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
