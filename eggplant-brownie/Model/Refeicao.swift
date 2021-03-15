//
//  Refeicao.swift
//  eggplant-brownie
//
//  Created by Jonattan Moises Sousa on 14/03/21.
//

import UIKit

class Refeicao: NSObject {
    
    // MARK: - Atributos
    let nome: String
    let felicidade: Int
    var itens: Array<Item> = []
    
    // MARK: - Init
    init(nome: String, felicidade: Int, itens: [Item] = []) { //Este construtor serve para usar atributos de classe sem inicializacao. Tambem para tratar a entrada, nao sendo possiviel instanciar o objeto sem os dados abaixo no ato.
        
        self.nome = nome
        self.felicidade = felicidade
        self.itens = itens
    }
    
    // MARK: - Metodos
    
    func totalDeCalorias() -> Double{
        var total = 0.0
        
        for item in itens{
            total += item.calorias
        }
        return total
    }
}
