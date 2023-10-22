//
//  HeaderView.swift
//  newTest2210
//
//  Created by Александр Молчан on 22.10.23.
//

import UIKit

final class HeaderView: UIView {
    
    // MARK: -
    // MARK: - UI Elements
    
    private lazy var containerView: UIView = {
        let view = UIView()
        return view
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.backgroundColor = .clear
        return stackView
    }()
    
    private lazy var numberLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 12, weight: .light)
        label.textColor = UIColor(red: 0.757, green: 0.761, blue: 0.780, alpha: 1)
        return label
    }()
    
    private lazy var countryLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 12, weight: .light)
        label.textColor = UIColor(red: 0.757, green: 0.761, blue: 0.780, alpha: 1)
        return label
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 12, weight: .light)
        label.textColor = UIColor(red: 0.757, green: 0.761, blue: 0.780, alpha: 1)
        return label
    }()
    
    private lazy var depositLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 12, weight: .light)
        label.textColor = UIColor(red: 0.757, green: 0.761, blue: 0.780, alpha: 1)
        return label
    }()
    
    private lazy var profitLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 12, weight: .light)
        label.textColor = UIColor(red: 0.757, green: 0.761, blue: 0.780, alpha: 1)
        return label
    }()
    
    // MARK: -
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layoutElements()
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: -
    // MARK: - Layout
    
    private func layoutElements() {
        self.addSubview(containerView)
        containerView.addSubview(stackView)
        stackView.addArrangedSubview(numberLabel)
        stackView.addArrangedSubview(countryLabel)
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(depositLabel)
        stackView.addArrangedSubview(profitLabel)
        
        self.backgroundColor = UIColor(red: 0.180, green: 0.188, blue: 0.239, alpha: 1)
        self.layer.cornerRadius = 10
        self.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        numberLabel.text = "№"
        countryLabel.text = "Country"
        nameLabel.text = "Name"
        depositLabel.text = "Deposit"
        profitLabel.text = "Profit"
    }
    
    private func makeConstraints() {
        containerView.snp.makeConstraints { make in
            make.width.equalToSuperview()
        }
        
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.height.equalTo(50)
        }
    }
    
}
