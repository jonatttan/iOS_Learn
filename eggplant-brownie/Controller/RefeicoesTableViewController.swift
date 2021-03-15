//
//  RefeicoesTableViewController.swift
//  eggplant-brownie
//
//  Created by Jonattan Moises Sousa on 15/03/21.
//

import UIKit

class RefeicoesTableViewController: UITableViewController {
    
    let refeicoes = [Refeicao(nome: "Macarrao", felicidade: 5),
                    Refeicao(nome: "Pizza", felicidade: 3),
                    Refeicao(nome: "Guaca Mole", felicidade: 2)]
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return refeicoes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil)
        let refeicao = refeicoes[indexPath.row]
        celula.textLabel?.text = refeicao.nome
        
        return celula
    }
}
