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
    var cellLabel: UILabel!
    var cellButton: UIButton!
    var delegate: PokemonViewCellDelegate? = nil
    
    override func awakeFromNib() {
        
        cellButton = UIButton(frame: contentView.frame)
//        cellButton.backgroundColor = UIColor.green
        cellButton.layer.borderColor = UIColor.black.cgColor
        cellButton.layer.borderWidth = 3
        cellButton.layer.cornerRadius = 3
        cellButton.clipsToBounds = true
        cellButton.addTarget(self, action: #selector(changeColor), for: .touchUpInside)
//        cellButton.contentVerticalAlignment = UIControlContentVerticalAlignment.bottom
        contentView.addSubview(cellButton)
        cellLabel = UILabel(frame: CGRect(x: 10, y: contentView.frame.maxY - 25, width: contentView.frame.width - 10, height: 20))
        cellLabel.font = UIFont(name: "Pokemon Classic", size: 7)
        contentView.addSubview(cellLabel)
        pokemonImageView = UIImageView(frame: CGRect(x: 10, y: 10, width: contentView.frame.width - 20, height: contentView.frame.height - 40))
        pokemonImageView.contentMode = .scaleToFill
        pokemonImageView.clipsToBounds = true
        contentView.addSubview(pokemonImageView) //Remember to add UI elements to the contentView, not the cell itself
    }
    
    @objc func changeColor(sender: UIButton) {
        delegate?.changeColorOfButton(forCell: self)
    }
}
