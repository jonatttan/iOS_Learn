//
//  Alerta.swift
//  eggplant-brownie
//
//  Created by Jonattan Moises Sousa on 16/03/21.
//

import UIKit

class Alerta {
    
    let controller: UIViewController
    
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    //Uso de valor padrao caso seu valor de argumento seja nulo
    func exibe(titulo: String = "Atencao", mensagem: String) {
        let alerta = UIAlertController(title: titulo, message: mensagem, preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alerta.addAction(ok)
        controller.present(alerta, animated: true, completion: nil)
    }
}
