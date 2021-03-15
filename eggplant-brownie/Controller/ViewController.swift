//
//  ViewController.swift
//  eggplant-brownie
//
//  Created by Jonattan Moises Sousa on 11/03/21.
//

import UIKit

class ViewController: UIViewController {
    
    //var nomeTexField: UITextField = UITextField() //instanciamos, mas não é a mais correta para o nosso uso no momento
    @IBOutlet var nomeTexField: UITextField? // Indicamos pro Swift que esta variável terá um valor
    @IBOutlet var felicidadeTextField: UITextField?
    
    
    @IBAction func adicionar(_ sender: Any) {
        
        //Abaixo a forma 'if let' de tratar a entrada, que no caso nao eh opcional para criar objeto.
        if let nomeRefeicao = nomeTexField?.text, let felicidadeRefeicao = felicidadeTextField?.text {
            
            let nome = nomeRefeicao
            
            if let felicidade = Int(felicidadeRefeicao) {
                
                let refeicao = Refeicao(nome: nome, felicidade: felicidade)
                print("comi \(refeicao.nome) e fiquei com felicidade: \(refeicao.felicidade)")
            } else {
                print("Erro ao cadastrar refeicao")
            }
        }
    }
}

// Obs: O Swift não é fortemente tipado, ou seja, não seria necessário explicitar que é String
