//
//  PokemonViewCell2.swift
//  Pokedex
//
//  Created by Mudabbir Khan on 2/16/18.
//  Copyright © 2018 trainingprogram. All rights reserved.
//

import UIKit

protocol PokemonViewCell2Delegate {
    func listButton(forCell: PokemonViewCell2)
}

class PokemonViewCell2: UITableViewCell {
    
    var pokemonImageView: UIImageView!
    var cellLabel: UILabel!
    var delegate: PokemonViewCell2Delegate? = nil

    override func awakeFromNib() {
        super.awakeFromNib()
        cellLabel = UILabel(frame: CGRect(x: 120, y: contentView.frame.midY, width: 200, height: 20))
        cellLabel.font = UIFont(name: "Pokemon Classic", size: 10)
        contentView.addSubview(cellLabel)
        pokemonImageView = UIImageView(frame: CGRect(x: 0, y: 5, width: 100, height: 60))
        pokemonImageView.contentMode = .scaleAspectFit
//        pokemonImageView.clipsToBounds = true
        contentView.addSubview(pokemonImageView)
        //Remember to add UI elements to the contentView, not the cell itself
    }

}
