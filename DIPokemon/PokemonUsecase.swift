//
//  PokemonUsecase.swift
//  DIPokemon
//
//  Created by 奥江英隆 on 2023/07/09.
//

import Foundation
import SwiftyDI

protocol PokemonUsecase {
    func pokemonInfo() async -> Result<Pokemon, ApiError>
}

class PokemonUsecaseImpl: PokemonUsecase {
    
    @Injected
    private var repository: PokemonRepository
    
    func pokemonInfo() async -> Result<Pokemon, ApiError> {
        return await repository.pokemonInfo()
    }
}
