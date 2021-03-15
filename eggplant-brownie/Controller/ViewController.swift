//
//  ViewController.swift
//  eggplant-brownie
//
//  Created by Jonattan Moises Sousa on 11/03/21.
//

import UIKit

protocol ViewControllerDelegate { //Tambem conhecido como Interface, no JAVA, por exemplo
    func add(_ refeicao: Refeicao)
}

class ViewController: UIViewController {
    
    var delegate: ViewControllerDelegate?
    
    //var nomeTexField: UITextField = UITextField() //instanciamos, mas não é a mais correta para o nosso uso no momento
    @IBOutlet var nomeTexField: UITextField? // Indicamos pro Swift que esta variável terá um valor
    @IBOutlet var felicidadeTextField: UITextField?
    
    
    @IBAction func adicionar(_ sender: Any) {
        
        guard let nomeRefeicao = nomeTexField?.text else {
            return
        }
        
        guard let felicidadeRefeicao = felicidadeTextField?.text, let felicidade = Int(felicidadeRefeicao) else {
            return
        }
        
        let refeicao = Refeicao(nome: nomeRefeicao, felicidade: felicidade)
        print("comi \(refeicao.nome) e fiquei com felicidade: \(refeicao.felicidade)")
        
        delegate?.add(refeicao)
        navigationController?.popViewController(animated: true)
    }
}

// Obs: O Swift não é fortemente tipado, ou seja, não seria necessário explicitar que é String
