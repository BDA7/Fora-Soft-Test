//
//  HistoryViewController.swift
//  Fora Soft Test
//
//  Created by Данила Бондаренко on 23.10.2021.
//

import UIKit
import UIKit


enum ActionHistoryView {
    case updateHistoryTable(history: [ModelHistory])
}

protocol HistoryViewProtocol {
    var interactor: HistoryInteractorProtocol? { get set }

    func action(with: ActionHistoryView)
}

final class HistoryViewController: UIViewController, HistoryViewProtocol, UITableViewDataSource, UITableViewDelegate {

    var interactor: HistoryInteractorProtocol?

//ELements of history
    var history = [ModelHistory]()

    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellHistory")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .black
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        settingsNavigationController()
        setupTable()
    }

    override func viewWillAppear(_ animated: Bool) {
        interactor?.action(with: .loadData)
    }
}
//MARK: - Actions for View
extension HistoryViewController {
    func action(with: ActionHistoryView) {
        switch with {
        case .updateHistoryTable(let history):
            updateHistoryTable(history: history)
        }
    }

    func updateHistoryTable(history: [ModelHistory]) {
        self.history = history
        tableView.reloadData()
    }
}

//MARK: - TableView Settings
extension HistoryViewController {
    func setupTable() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return history.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellHistory", for: indexPath)

        let historyElement = history[indexPath.row]
        cell.textLabel?.text = historyElement.text
        cell.backgroundColor = .black
        cell.textLabel?.textColor = .white

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let historyElement = history[indexPath.row]
        interactor?.action(with: .selectElement(element: historyElement.text))
    }
}

//MARK: - NavController Settings
extension HistoryViewController {
    func settingsNavigationController() {
        self.navigationController?.navigationBar.barTintColor = .black
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(clearHistory))
    }
//Button for clear history
    @objc func clearHistory(_ sender: UIButton) {
        interactor?.action(with: .clearHistory)
    }
}
