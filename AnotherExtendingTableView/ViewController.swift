//
//  ViewController.swift
//  AnotherExtendingTableView
//
//  Created by Roderick Presswood on 2/28/24.
//

import UIKit

class ViewController: UIViewController {
    
    var dataSource = [CellDataModel(title: "Artificial Intelligence (AI):", iconName: "info.circle", description: "Artificial Intelligence (AI) refers to the simulation of human intelligence in machines that are programmed to think and mimic human actions. These machines are designed to perform tasks that typically require human intelligence, such as speech recognition, decision-making, visual perception, and language translation. AI technologies include machine learning, natural language processing, computer vision, and robotics. AI has applications across various industries, including healthcare, finance, transportation, and entertainment, and has the potential to revolutionize the way we live and work."),
                      CellDataModel(title: "Blockchain Technology:", iconName: "info.circle", description: "Blockchain technology is a decentralized digital ledger that records transactions across multiple computers in a way that is transparent, secure, and tamper-proof. Each block in the blockchain contains a cryptographic hash of the previous block, along with transaction data, creating a chain of blocks linked together. This technology eliminates the need for intermediaries in transactions, such as banks or financial institutions, and enables peer-to-peer transactions without the risk of double-spending. Blockchain is most commonly associated with cryptocurrencies like Bitcoin, but its potential applications extend to supply chain management, voting systems, identity verification, and more."),
                      CellDataModel(title: "Internet of Things (IoT):", iconName: "info.circle", description: "The Internet of Things (IoT) refers to the network of interconnected devices embedded with sensors, software, and other technologies that enable them to collect and exchange data over the internet. These devices can range from everyday objects like household appliances and wearable devices to industrial machines and smart city infrastructure. IoT enables the seamless integration of physical and digital systems, allowing for automation, real-time monitoring, and data-driven decision-making. It has the potential to revolutionize industries such as healthcare, agriculture, manufacturing, and urban planning by improving efficiency, productivity, and sustainability.")
    ]
    
    var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.estimatedRowHeight = 50
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .blue
        
        setup()
    }
    
    private func setup() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(ExpandableTableTableViewCell.self, forCellReuseIdentifier: ExpandableTableTableViewCell.cellIdentifier)
        
        view.addSubview(tableView)
        tableView.backgroundColor = .systemPink
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ExpandableTableTableViewCell.cellIdentifier, for: indexPath) as! ExpandableTableTableViewCell
        cell.set(from: dataSource[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        dataSource[indexPath.row].isExpanded.toggle()
//            tableView.reloadRows(at: [indexPath], with: .automatic)
        tableView.reloadData()
        self.view.layoutIfNeeded()
    }
    
}
