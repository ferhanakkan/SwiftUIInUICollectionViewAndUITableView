//
//  HomeController.swift
//  SwiftUIInUICollectionViewAndUITableView
//
//  Created by Ferhan Akkan on 13.06.2022.
//

import UIKit

final class HomeController: UIViewController {

    var titles: [ExampleType] {
        ExampleType.allCases
    }

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(HomeTableViewCell.self, forCellReuseIdentifier: HomeTableViewCell.description())
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setLayout()
    }

    private func setLayout() {
        title = "Rich And Morty"
        view.backgroundColor = .white
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}

extension HomeController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let richAndMortyAPI = RichAndMortyAPI(networkLayer: .init())

        switch titles[indexPath.row] {

        case .episodes:
            navigationController?.show(EpisodesController(with: .init(api: richAndMortyAPI)), sender: nil)
            
        case .characters:
            navigationController?.show(CharactersController(with: .init(api: richAndMortyAPI)), sender: nil)
        }
        navigationController?.viewControllers.last?.title = titles[indexPath.row].rawValue
    }
}

extension HomeController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        titles.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.description(), for: indexPath) as? HomeTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(with: titles[indexPath.row].rawValue)
        return cell
    }
}
