//
//  PokemonImageDownloader.swift
//  DIPokemon
//
//  Created by 奥江英隆 on 2023/07/09.
//

import Foundation
import AlamofireImage
import UIKit

class PokemonImageDownloader {
    
    static let shard = PokemonImageDownloader()
    private init() {}
    
    let downloadImage = ImageDownloader()
    
    func download(urlString: String, completionHandler: @escaping (UIImage) -> Void) {
        guard let url = URL(string: urlString) else {
            return
        }
        downloadImage.download(URLRequest(url: url), completion: { responce in
            switch responce.result {
            case .success(let image):
                completionHandler(image)
            case .failure:
                fatalError("Invaild Image")
            }
        })
    }
}
