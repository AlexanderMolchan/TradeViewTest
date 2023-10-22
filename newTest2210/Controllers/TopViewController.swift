//
//  TopViewController.swift
//  newTest2210
//
//  Created by Александр Молчан on 21.10.23.
//

import UIKit
import SnapKit

final class TopViewController: UIViewController {
    
    // MARK: -
    // MARK: - UI Elements
    
    private let bounceAnimation: CAKeyframeAnimation = {
        let bounceAnimation = CAKeyframeAnimation(keyPath: "transform.scale")
        bounceAnimation.values = [1.0, 1.8, 0.9, 1.0]
        bounceAnimation.duration = 0.5
        bounceAnimation.calculationMode = CAAnimationCalculationMode.cubic
        return bounceAnimation
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22, weight: .heavy)
        label.textColor = .white
        label.text = "TOP 10 Traders"
        return label
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        tableView.layer.cornerRadius = 9
        return tableView
    }()
    
    // MARK: -
    // MARK: - Properties
    
    private let dataSource = TraiderData()
    private var traidersArray = [TraiderModel]()
    
    // MARK: -
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        layoutElements()
        makeConstraints()
        tableViewSettings()
        depositAdd()
    }
    
    // MARK: -
    // MARK: - Logic
    
    private func getData() {
        traidersArray = dataSource.getTraiderData()
    }
    
    private func depositAdd() {
        Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { _ in
            let randomTraider = Int.random(in: 0...self.traidersArray.count - 1)
            let randomDeposit = Int.random(in: 100...200)
            self.traidersArray[randomTraider].deposit += randomDeposit
            self.tableView.reloadData()
            (self.tableView.cellForRow(at: IndexPath(row: randomTraider, section: 0)) as? TopCell)?.depositLabel.layer.add(self.bounceAnimation, forKey: nil)
            Timer.scheduledTimer(withTimeInterval: 0.7, repeats: false) { _ in
                self.traidersArray.sort(by: { $0.deposit > $1.deposit })
                self.tableView.reloadData()
            }
        }
    }
    
    private func tableViewSettings() {
        tableView.register(TopCell.self, forCellReuseIdentifier: TopCell.id)
    }
    
    // MARK: -
    // MARK: - Layout
    
    private func layoutElements() {
        view.backgroundColor = UIColor(red: 0.114, green: 0.122, blue: 0.173, alpha: 1)
        view.addSubview(titleLabel)
        view.addSubview(tableView)
    }
    
    private func makeConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(64)
            make.centerX.equalToSuperview()
        }
        tableView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(29)
            make.leading.trailing.equalToSuperview().inset(12)
            make.bottom.equalToSuperview()
        }
    }

}

// MARK: -
// MARK: - TableView extensions
    
extension TopViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        traidersArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TopCell.id, for: indexPath)
        guard let topCell = cell as? TopCell else { return cell }
        topCell.cellConfigurate(traider: traidersArray[indexPath.row], index: indexPath.row + 1)
        return topCell
    }
}

extension TopViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return HeaderView()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
}
