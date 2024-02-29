//
//  ExpandableTableTableViewCell.swift
//  AnotherExtendingTableView
//
//  Created by Roderick Presswood on 2/28/24.
//

import UIKit

class ExpandableTableTableViewCell: UITableViewCell {
    
    static let cellIdentifier = String(describing: ExpandableTableTableViewCell.self)
    
    let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        return stackView
    }()
    
    let subStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .equalSpacing
        stackView.axis = .horizontal
        return stackView
    }()
    
    let icon: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    let chevronIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func set(from model: CellDataModel) {
        setup()
        
        icon.image = UIImage(systemName: model.iconName)
        titleLabel.text = model.title
        descriptionLabel.text = model.description
        
        descriptionLabel.isHidden = !model.isExpanded
        chevronIcon.image = (model.isExpanded ? UIImage(systemName: "chevron.up") : UIImage(systemName: "chevron.down"))?.withRenderingMode(.alwaysTemplate)
    }
    
    func setup() {
        contentView.addSubview(mainStackView)
        mainStackView.addArrangedSubview(subStackView)
        mainStackView.addArrangedSubview(descriptionLabel)
        subStackView.addArrangedSubview(icon)
        subStackView.addArrangedSubview(titleLabel)
        subStackView.addArrangedSubview(chevronIcon)
        
        setConstraints()
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        ])
    }
    
}
