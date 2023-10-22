//
//  CurrencyCell.swift
//  newTest2210
//
//  Created by Александр Молчан on 22.10.23.
//

import UIKit

final class CurrencyCell: UICollectionViewCell {
    static let id = String(describing: CurrencyCell.self)
    private var currencyType: CurrencyTypes = .eurUsd
    
    // MARK: -
    // MARK: - UI Elements
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22, weight: .heavy)
        label.textColor = .white
        return label
    }()
    
    private lazy var banner: UIView = {
        let banner = UIView()
        //       banner.backgroundColor = UIColor(red: 0.204, green: 0.216, blue: 0.282, alpha: 1)
        banner.layer.cornerRadius = 10
        return banner
    }()
    
    // MARK: -
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configurate()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: -
    // MARK: - Configurations
    
    private func configurate() {
        layoutElements()
        makeConstraints()
    }
    
    private func layoutElements() {
        contentView.addSubview(banner)
        banner.addSubview(titleLabel)
        titleLabel.text = currencyType.rawValue
    }
    
    private func makeConstraints() {
        banner.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
    
    func set(type: CurrencyTypes) {
        self.currencyType = type
        titleLabel.text = currencyType.rawValue
        banner.backgroundColor = isSelected ? UIColor(red: 0.373, green: 0.714, blue: 0.471, alpha: 1) : UIColor(red: 0.204, green: 0.216, blue: 0.282, alpha: 1)
    }
    
}
