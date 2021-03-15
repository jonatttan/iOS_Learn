// Usando orientacao a objeto e metodo construtor. Criando e printando objetos.

import UIKit

class Refeicao {
    
    // MARK: - Atributos
    var nome: String
    var felicidade: String
    var itens: Array<Item> = []
    
    // MARK: - Construtor
    init(nome: String, felicidade: String) { //Este construtor serve para usar atributos de classe sem inicializacao. Tambem para tratar a entrada, nao sendo possiviel instanciar o objeto sem os dados abaixo no ato.
        
        self.nome = nome
        self.felicidade = felicidade
        
    }

}

class Item {
    let nome: String
    let calorias: Double
    
    init(nome: String, calorias: Double) {
        self.nome = nome
        self.calorias = calorias
    }
}

let feijao = Item(nome: "Feijao", calorias: 45.9)
let arroz = Item(nome: "Arroz", calorias: 12)
let contraFile = Item(nome: "Contra File", calorias: 30)


//
//let meuAlmoco = Refeicao(nome: "Lasanha", felicidade: "5")
//let minhaJanta = Refeicao(nome: "Macarronada", felicidade: "4")
//
//print(meuAlmoco.nome)
//print(meuAlmoco.felicidade)
//
//print(minhaJanta.nome)
//print(minhaJanta.felicidade)
