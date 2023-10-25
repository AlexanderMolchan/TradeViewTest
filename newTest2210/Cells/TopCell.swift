//
//  TopCell.swift
//  newTest2210
//
//  Created by Александр Молчан on 21.10.23.
//

import UIKit

final class TopCell: UITableViewCell {
    static let id = String(describing: TopCell.self)
    
    // MARK: -
    // MARK: - UI Elements
    
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
        label.font = .systemFont(ofSize: 14, weight: .heavy)
        label.textColor = .white
        return label
    }()
    
    private lazy var countryImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .center
        return imageView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 14, weight: .heavy)
        label.textColor = .white
        return label
    }()
    
    lazy var depositLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 14, weight: .heavy)
        label.textColor = .white
        return label
    }()
    
    private lazy var profitLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 14, weight: .heavy)
        label.textColor = UIColor(red: 0.373, green: 0.714, blue: 0.471, alpha: 1)
        return label
    }()
    
    // MARK: -
    // MARK: - Initialization
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layoutElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    // MARK: -
    // MARK: - Configuration
    
    func cellConfigurate(traider: TraiderModel? = nil, index: Int? = nil) {
        guard let index, let traider else { return }
        backgroundColor = index % 2 == 0 ? UIColor(red: 0.180, green: 0.188, blue: 0.239, alpha: 1) : .clear
        countryImage.snp.makeConstraints { make in
            make.width.equalTo(10)
            make.height.equalTo(10)
        }
        numberLabel.text = "\(index)"
        countryImage.image = traider.country
        nameLabel.text = traider.name
        depositLabel.text = "\(traider.deposit)"
        profitLabel.text = "\(traider.profit)"
    }

    private func layoutElements() {
        selectionStyle = .none
        addSubview(stackView)
        stackView.addArrangedSubview(numberLabel)
        stackView.addArrangedSubview(countryImage)
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(depositLabel)
        stackView.addArrangedSubview(profitLabel)
        
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.height.equalTo(50)
        }
    }
    
}


