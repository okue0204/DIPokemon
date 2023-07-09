//
//  PokemonRepositoryMock.swift
//  DIPokemon
//
//  Created by 奥江英隆 on 2023/07/09.
//

import Foundation

class PokemonRepositoryMock:PokemonRepository {
    func pokemonInfo() async -> Result<Pokemon, ApiError> {
        return .success(Self.pokemonInfo)
    }
}

extension PokemonRepositoryMock {
    static var pokemonInfo: Pokemon {
        return Pokemon(id: 1,
                       name: "ピカチュウ",
                       imageUrl: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/25.png",
                       attributes: [.electric])
    }
}

