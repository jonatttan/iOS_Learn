//
//  Item.swift
//  eggplant-brownie
//
//  Created by Jonattan Moises Sousa on 14/03/21.
//

import UIKit

class Item: NSObject {
    
    // MARK: - Atributos
    let nome: String
    let calorias: Double

    // MARK: - Construtor
    init(nome: String, calorias: Double) {
        self.nome = nome
        self.calorias = calorias
    }

}
