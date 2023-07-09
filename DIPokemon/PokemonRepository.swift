//
//  PokemonRepository.swift
//  DIPokemon
//
//  Created by 奥江英隆 on 2023/07/09.
//

import Foundation

protocol PokemonRepository {
    func pokemonInfo() async -> Result<Pokemon, ApiError>
}

class PokemonRepositoryImpl: PokemonRepository {
    func pokemonInfo() async -> Result<Pokemon, ApiError> {
        switch await ApiRequest.shard.request() {
        case .success(let json):
            do {
                return .success( try Pokemon(json: json))
            } catch let error as EntitiyCreationError {
                return .failure(.illegalResponse(case: error))
            } catch {
                fatalError("")
            }
        case .failure(let error):
            return .failure(error)
        }
    }
}
