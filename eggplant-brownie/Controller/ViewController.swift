//
//  ViewController.swift
//  eggplant-brownie
//
//  Created by Jonattan Moises Sousa on 11/03/21.
//

import UIKit

protocol AdicionaRefeicaoDelegate { //Tambem conhecido como Interface, no JAVA, por exemplo
    func add(_ refeicao: Refeicao)
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, AdicionaItensDelegate {
    
    //MARK: - IBOutlet
    
    
    @IBOutlet weak var itensTableView: UITableView?
    
    // MARK: - Atributos
    
    var delegate: AdicionaRefeicaoDelegate?
    var itens: [Item] = []
    var itensSelecionados: [Item] = []
    
    // MARK: - IBOutlets
    
    @IBOutlet var nomeTexField: UITextField? // Indicamos pro Swift que esta variável terá um valor
    @IBOutlet var felicidadeTextField: UITextField?
    
    
    //MARK: - View Life Cycle
    
    override func viewDidLoad() { //Botao criado programaticamente
        let botaoAdicionaItem = UIBarButtonItem(title: "Adicionar", style: .plain, target: self, action: #selector(adicionarItens))
        navigationItem.rightBarButtonItem = botaoAdicionaItem
        recuperaItens()
    }
    
    func recuperaItens() {
        itens = ItemDao().recupera()
    }
    
    @objc func adicionarItens() { //Funcao para navegar ate a view de add itens
        let adicionarItensViewController = AdicionarItensViewController(delegate: self)
        navigationController?.pushViewController(adicionarItensViewController, animated: true)
    }
    
    func add(_ item: Item) {
        itens.append(item)
        ItemDao().save(itens)
        //Esse if-else trata erro de vinculo com a tabela ou algum outro impeditivo na atualizacao.
        if let tableView = itensTableView {
            tableView.reloadData()
        } else {
            // codEgo
            Alerta(controller: self).exibe(mensagem: "Nao foi possivel atualizar a tabela")
        }        
    }
    
    
    // MARK: - UITableViewDataSource
    
    //Conta itens para criar celulas
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itens.count
    }
    
    //Popula celulas percorrendo itens
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil)
        
        let linhaDaTabela = indexPath.row
        let item = itens[linhaDaTabela]
        
        celula.textLabel?.text = item.nome
        
        return celula
    }
    
    // MARK: UITableViewDelegate
    
    //Intercepta acao do user dentro da tabela, da um .checkmark,
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let celula = tableView.cellForRow(at: indexPath) else {return}
        
        if celula.accessoryType == .none {
            celula.accessoryType = .checkmark
            
            let linhaDaTabela = indexPath.row
            itensSelecionados.append(itens[linhaDaTabela])
        } else {
            celula.accessoryType = .none
            
            let item = itens[indexPath.row]
            if let position = itensSelecionados.firstIndex(of: item) {
                itensSelecionados.remove(at: position)
                
                // teste
                for itemSelected in itensSelecionados {
                    print(itemSelected.nome)
                     print(itemSelected.calorias)
                }
            }
            
        }
    }
    
    
    // MARK: - IBActions
    
    func recuperaRefeicaoDoFormulario() -> Refeicao? {
        
        guard let nomeRefeicao = nomeTexField?.text else {
            //Alerta(controller: self).exibe(mensagem: "Erro ao ler o campo nome.")
            return nil
        }
        guard let felicidadeRefeicao = felicidadeTextField?.text, let felicidade = Int(felicidadeRefeicao) else {
            //Alerta(controller: self).exibe(mensagem: "Erro ao ler o campo felicidade.")
            return nil
        }
        
        let refeicao = Refeicao(nome: nomeRefeicao, felicidade: felicidade, itens: itensSelecionados)
        
        return refeicao
    }
    
    @IBAction func adicionar(_ sender: Any) {
        
        if let refeicao = recuperaRefeicaoDoFormulario() {
            delegate?.add(refeicao)
            navigationController?.popViewController(animated: true)
        } else {
            Alerta(controller: self).exibe(mensagem: "Erro ao ler o formulario.")
        }
        
        
    }
}

// Obs: O Swift não é fortemente tipado, ou seja, não seria necessário explicitar que é String
