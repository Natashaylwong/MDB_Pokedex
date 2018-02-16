//
//  PokemonViewCell.swift
//  Pokedex
//
//  Created by Mudabbir Khan on 2/15/18.
//  Copyright © 2018 trainingprogram. All rights reserved.
//

import UIKit

protocol PokemonViewCellDelegate {
    func changeColorOfButton(forCell: PokemonViewCell)
}

class PokemonViewCell: UICollectionViewCell {
    
    var pokemonImageView: UIImageView!
    var cellButton: UIButton!
    var delegate: PokemonViewCellDelegate? = nil
    
    override func awakeFromNib() {
        pokemonImageView = UIImageView(frame: contentView.frame)
        pokemonImageView.contentMode = .scaleAspectFill
        pokemonImageView.clipsToBounds = true
        contentView.addSubview(pokemonImageView) //Remember to add UI elements to the contentView, not the cell itself
        
        cellButton = UIButton(frame: CGRect(x: (contentView.frame.width - 30)/3, y: (contentView.frame.height - 40)/2, width: (contentView.frame.width - 30)/3, height: (contentView.frame.width - 30)/3))
        cellButton.backgroundColor = UIColor.green
        cellButton.setTitle("Change My Color", for: .normal)
        cellButton.layer.cornerRadius = 3
        cellButton.clipsToBounds = true
        cellButton.addTarget(self, action: #selector(changeColor), for: .touchUpInside)
        contentView.addSubview(cellButton)
    }
    
    func changeColor(sender: UIButton) {
        print("changing color")
        delegate?.changeColorOfButton(forCell: self)
    }
}
