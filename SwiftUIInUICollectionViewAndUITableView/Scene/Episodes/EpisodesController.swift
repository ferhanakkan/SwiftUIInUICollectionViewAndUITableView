//
//  EpisodesController.swift
//  SwiftUIInUICollectionViewAndUITableView
//
//  Created by Ferhan Akkan on 14.06.2022.
//

import UIKit

final class EpisodesController: UIViewController {

    private let viewModel: EpisodesViewModel

    private lazy var tableView: UITableView = { [weak self] in
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(EpisodeTableViewCell.self, forCellReuseIdentifier: EpisodeTableViewCell.description())
        tableView.delegate = self
        tableView.dataSource = self
        tableView.selfSizingInvalidation = .enabledIncludingConstraints
        return tableView
    }()

    init(with viewModel: EpisodesViewModel) {
        self.viewModel = viewModel

        super.init(nibName: nil, bundle: nil)

        self.viewModel.output = self
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setLayout()
        viewModel.viewDidLoad()
    }

    private func setLayout() {
        title = "Episodes"
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

extension EpisodesController: EpisodeTableViewCellOutput {
    func didTapButton(with viewModel: EpisodeTableViewCellViewModel, isExpanded: Bool) {
        self.viewModel.updateDatas(viewModel: viewModel, isExpanded: isExpanded)
    }

    func didTapDelete(_ cell: EpisodeTableViewCell) {
        guard let indexPath = tableView.indexPath(for: cell) else {
            return
        }
        viewModel.deleteData(with: indexPath)
        tableView.deleteRows(at: [indexPath], with: .left)
    }
}

extension EpisodesController: EpisodesViewModelOutput {
    func didFetchCompleted() {
        tableView.reloadData()
    }
}

extension EpisodesController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension EpisodesController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.datas.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: EpisodeTableViewCell.description(), for: indexPath) as? EpisodeTableViewCell else {
            return UITableViewCell()
        }
        cell.output = self
        cell.configure(with: viewModel.datas[indexPath.row])
        return cell
    }
}
