//
//  FilteredViewController.swift
//  Pokedex
//
//  Created by Natasha Wong on 2/15/18.
//  Copyright © 2018 trainingprogram. All rights reserved.
//

import UIKit

class FilteredViewController: UIViewController {
    var attack: Int!
    var health: Int!
    var defense: Int!
    var favPokemon: Array<Int>!
    var randomPokemon: Set<Int>!
    var namePokemon: String!
    
    var gridView: UICollectionView!
    var listView: UITableView!
    var pokemonArray = PokemonGenerator.getPokemonArray()
    var numOfPokemon: Int = 800

    override func viewDidLoad() {
        super.viewDidLoad()
        setupListView()
        setupGridView()
        settingSC()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
    }
    
    func setupListView() {
        listView = UITableView(frame: view.frame)
        listView.register(PokemonViewCell2.self, forCellReuseIdentifier: "pokemonCell2")
        listView.backgroundColor = UIColor.white
        listView.tag = 1
        listView.delegate = self
        listView.dataSource = self
        view.addSubview(listView)
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
    
    func settingSC() {
        navigationController?.navigationBar.barTintColor = UIColor.red
        navigationController?.navigationBar.barTintColor?.withAlphaComponent(0.5)
        navigationController?.navigationBar.tintColor = UIColor.white;
        self.navigationController?.navigationBar.alpha = 0.3
        let items = ["Grid", "List"]
        let customSC = UISegmentedControl(items: items)
        customSC.selectedSegmentIndex = 1
        gridView.isHidden = true
        listView.isHidden = false
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
}
    
extension FilteredViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numOfPokemon
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "pokemonCell2", for: indexPath) as! PokemonViewCell2
        for view in cell.subviews {
            view.removeFromSuperview()
        }
        cell.awakeFromNib()
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let pokemonCell = cell as! PokemonViewCell2
        let pokemon = pokemonArray[indexPath.item]
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
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
        for view in cell.subviews {
            view.removeFromSuperview()
        }
        cell.awakeFromNib()
        cell.delegate = self
        return cell
    }
    
    //We use this method to populate the data of a given cell
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let pokemonCell = cell as! PokemonViewCell
        let pokemon = pokemonArray[indexPath.item]
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
    }
    
}

extension FilteredViewController: PokemonViewCellDelegate, PokemonViewCell2Delegate {
    func changeColorOfButton2(forCell: PokemonViewCell2) {
        forCell.cellButton.backgroundColor = UIColor.blue
    }
    
    func changeColorOfButton(forCell: PokemonViewCell) {
        forCell.cellButton.backgroundColor = UIColor.blue
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
