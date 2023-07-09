//
//  ViewController.swift
//  DIPokemon
//
//  Created by 奥江英隆 on 2023/07/09.
//

import UIKit
import SwiftyDI

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    @Injected
    private var usecase: PokemonUsecase
    
    var pokemonList: [Pokemon] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareSetting()
    }
    
    private func prepareSetting() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .black
        tableView.register(UINib(nibName: String(describing: PokemonTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: PokemonTableViewCell.self))
    }
    
    @IBAction func getButtonDidTap(_ sender: Any) {
        Task {
            switch await usecase.pokemonInfo() {
            case .success(let pokemon):
                pokemonList.append(pokemon)
                tableView.reloadData()
            case .failure(let error):
                fatalError("\(error.localizedDescription)")
            }
        }
    }
}

extension ViewController: UITableViewDelegate {
    
}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        pokemonList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: PokemonTableViewCell.self), for: indexPath) as! PokemonTableViewCell
        cell.pokemon = pokemonList[indexPath.row]
        return cell
    }
}

