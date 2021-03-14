//
//  ViewController.swift
//  eggplant-brownie
//
//  Created by Jonattan Moises Sousa on 11/03/21.
//

import UIKit

class ViewController: UIViewController {
    
    //var nomeTexField: UITextField = UITextField() //instanciamos, mas não é a mais correta para o nosso uso no momento
    @IBOutlet var nomeTexField: UITextField! // Indicamos pro Swift que esta variável terá um valor
    @IBOutlet var felicidadeTextField: UITextField!
    
    
    @IBAction func adicionar(_ sender: Any) {
        let nome = nomeTexField.text
        let felicidade = felicidadeTextField.text

        print("comi \(nome) e fiquei com felicidade: \(felicidade)")
    }
    
}

// Obs: O Swift não é fortemente tipado, ou seja, não seria necessário explicitar que é String
