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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
