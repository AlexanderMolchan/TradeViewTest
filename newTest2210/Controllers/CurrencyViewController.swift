//
//  CurrencyViewController.swift
//  newTest2210
//
//  Created by Александр Молчан on 22.10.23.
//

import UIKit

final class CurrencyViewController: UIViewController {
    
    // MARK: -
    // MARK: - UI Elements
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22, weight: .heavy)
        label.textColor = .white
        label.text = "Currency pair"
        return label
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 37, bottom: 0, right: 37)
        return collectionView
    }()
    
    // MARK: -
    // MARK: - Properties
    
    var changeCurrency: ((CurrencyTypes) -> ())?
    private var currencyArray = CurrencyTypes.allCases
    var selectedCurrency: CurrencyTypes
    
    // MARK: -
    // MARK: - Lifecycle
    
    init(selectedCurrency: CurrencyTypes) {
        self.selectedCurrency = selectedCurrency
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layoutElements()
        makeConstraints()
        registerCells()
    }
    
    // MARK: -
    // MARK: - Configurations
    
    private func layoutElements() {
        view.backgroundColor = UIColor(red: 0.114, green: 0.122, blue: 0.173, alpha: 1)
        view.addSubview(titleLabel)
        view.addSubview(collectionView)
    }
    
    private func makeConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(64)
            make.centerX.equalToSuperview()
        }
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(36)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    private func registerCells() {
        collectionView.register(CurrencyCell.self, forCellWithReuseIdentifier: CurrencyCell.id)
    }
    
}

// MARK: -
// MARK: - CollectionView extensions

extension CurrencyViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        currencyArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CurrencyCell.id, for: indexPath)
        guard let currencyCell = cell as? CurrencyCell else { return cell }
        currencyCell.isSelected = selectedCurrency == currencyArray[indexPath.row]
        currencyCell.set(type: currencyArray[indexPath.row])
        return currencyCell
    }
}

extension CurrencyViewController:  UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        selectedCurrency = currencyArray[indexPath.row]
        collectionView.reloadData()
        changeCurrency?(selectedCurrency)
        navigationController?.popViewController(animated: true)
    }
}

extension CurrencyViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = UIScreen.main.bounds.width
            let width = ((screenWidth - 95) / 2)
            let height = CGFloat(54)
            return CGSize(width: width, height: height)
    }
}
