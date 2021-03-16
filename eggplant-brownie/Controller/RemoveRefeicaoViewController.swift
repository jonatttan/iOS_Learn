//
//  RemoveRefeicaoViewController.swift
//  eggplant-brownie
//
//  Created by Jonattan Moises Sousa on 16/03/21.
//

import UIKit

class RemoveRefeicaoViewController {
    
    let controller: UIViewController
    
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    func exibe(_ refeicao: Refeicao, handler: @escaping (UIAlertAction) -> Void){
        //Abaixo um modal de alerta UIAlertController, com botao cancelar e metodo present para exibicao
        let alerta = UIAlertController(title: refeicao.nome, message: refeicao.detalhes(), preferredStyle: .alert)
        let botaoCancelar = UIAlertAction(title: "cancelar", style: .cancel)
        alerta.addAction(botaoCancelar)
        let botaoRemover = UIAlertAction(title: "remover", style: .destructive, handler: handler)
        //closure: Eh o ato de passar uma funcao dentro de outra funcao
        alerta.addAction(botaoRemover)
        
        controller.present(alerta, animated: true, completion: nil)
    }
}
