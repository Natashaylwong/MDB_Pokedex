//
//  PokemonViewCell2.swift
//  Pokedex
//
//  Created by Mudabbir Khan on 2/16/18.
//  Copyright © 2018 trainingprogram. All rights reserved.
//

import UIKit

protocol PokemonViewCell2Delegate {
    func changeColorOfButton2(forCell: PokemonViewCell2)
}

class PokemonViewCell2: UITableViewCell {
    
    var pokemonImageView: UIImageView!
    var cellLabel: UILabel!
    var cellButton: UIButton!
    var delegate: PokemonViewCell2Delegate? = nil

    override func awakeFromNib() {
        super.awakeFromNib()
        cellButton = UIButton(frame: contentView.frame)
        //        cellButton.backgroundColor = UIColor.green
        cellButton.layer.borderColor = UIColor.black.cgColor
        cellButton.layer.borderWidth = 3
        cellButton.layer.cornerRadius = 3
        cellButton.clipsToBounds = true
        cellButton.addTarget(self, action: #selector(changeColor), for: .touchUpInside)
        //        cellButton.contentVerticalAlignment = UIControlContentVerticalAlignment.bottom
        contentView.addSubview(cellButton)
        cellLabel = UILabel(frame: CGRect(x: contentView.frame.maxX - 100, y: contentView.frame.midY, width: contentView.frame.width - 100, height: 20))
        cellLabel.font = UIFont(name: "Pokemon Classic", size: 7)
        contentView.addSubview(cellLabel)
        pokemonImageView = UIImageView(frame: CGRect(x: 10, y: contentView.frame.midY, width: 100, height: contentView.frame.height - 10))
        pokemonImageView.contentMode = .scaleToFill
        pokemonImageView.clipsToBounds = true
        contentView.addSubview(pokemonImageView) //Remember to add UI elements to the contentView, not the cell itself
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @objc func changeColor(sender: UIButton) {
        print("changing color")
        delegate?.changeColorOfButton2(forCell: self)
    }

}
