//
//  AdicionarItensViewController.swift
//  eggplant-brownie
//
//  Created by Jonattan Moises Sousa on 15/03/21.
//

import UIKit

protocol AdicionaItensDelegate {
    func add(_ item: Item)
}

class AdicionarItensViewController: UIViewController {

    // MARK: - IBOutlets
    
    @IBOutlet weak var nomeTextField: UITextField!
    @IBOutlet weak var caloriasTextField: UITextField!
    
    // MARK: - Atributos
    
    var delegate: AdicionaItensDelegate?
    
    init(delegate: AdicionaItensDelegate) {
        super.init(nibName: "AdicionarItensViewController", bundle: nil)
        self.delegate = delegate
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
     
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // MARK:
    
    // MARK: - IBAction

    @IBAction func adicionarItem(_ sender: Any) {
        
        guard let nome = nomeTextField.text, let calorias = caloriasTextField.text else { return }
        
        if let caloria = Double(calorias) {
            let item = Item(nome: nome, calorias: caloria)
            delegate?.add(item)
            navigationController?.popViewController(animated: true)
        }
        
        // Navegar para a proxima tela, utiliza-se: navigationController.push()
        // Navegar para a tela anterior, utiliza-se: navigationController.pop()
    }
    
}
