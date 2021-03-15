// Usando orientacao a objeto e metodo construtor. Criando e printando objetos.
// Criando/ instanciando objeto lista da classe (Item) dentro da classe (Refeicao) e manipulando seus valores

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
    
    // MARK: - Metodos
    
    func totalDeCalorias() -> Double{
        var total = 0.0
        
        for item in itens{
            total += item.calorias
        }
        return total
    }

}

//Classe de itens
class Item { //Seria como uma lista de itens da refeicao, ja ha um array na classe refeicao instanciada com seu tipo
    let nome: String
    let calorias: Double
    
    init(nome: String, calorias: Double) {
        self.nome = nome
        self.calorias = calorias
    }
}

//Instanciando itens com suas propriedades
let feijao = Item(nome: "Feijao", calorias: 45.9)
let arroz = Item(nome: "Arroz", calorias: 12)
let contraFile = Item(nome: "Contra File", calorias: 30)

//Instanciando refeicao e suas propriedades
let refeicao = Refeicao(nome: "Almoco", felicidade: "4")

//Adicionando a lista itens do objeto refeicao
refeicao.itens.append(arroz)
refeicao.itens.append(feijao)
refeicao.itens.append(contraFile)

//Printando o primeiro item da lista itens do objeto refeicao com 'if let'
if let primeiroItemDaLista = refeicao.itens.first {
    print(primeiroItemDaLista.nome)
}

//Printando o total de calorias ao chamar o metodo de calculo dentro da classe Refeicao, todo objeto tem o metodo de calculo. ;)
print(refeicao.totalDeCalorias())

