//
//  PokemonTableViewCell.swift
//  DIPokemon
//
//  Created by 奥江英隆 on 2023/07/09.
//

import UIKit

class PokemonTableViewCell: UITableViewCell {
    
    @IBOutlet weak var pokemonImageView: UIImageView!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var attribute1Label: UILabel!
    @IBOutlet weak var attribute2Label: UILabel!
    
    private lazy var attributelabels = [attribute1Label,
                                        attribute2Label]
    
    var pokemon: Pokemon? {
        didSet {
            guard let pokemon else {
                return
            }
            configure(pokemon: pokemon)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func configure(pokemon: Pokemon) {
        idLabel.text = String(pokemon.id)
        nameLabel.text = pokemon.name
        attribute2Label.isHidden = pokemon.attributes.count == 1
        pokemon.attributes.enumerated().forEach { offset, element in
            attributelabels[offset]?.text = element.title
            attributelabels[offset]?.textColor = element.color
        }
        
    }
}
