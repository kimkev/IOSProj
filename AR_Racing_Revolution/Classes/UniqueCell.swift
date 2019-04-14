//
//  UniqueCell.swift
//  AR_Racing_Revolution
//
//  Created by Xcode User on 2019-04-13.
//  Copyright © 2019 Xcode User. All rights reserved.
//

import UIKit

class UniqueCell: UITableViewCell {

    let nameLabel = UILabel()
    let highscoreLabel = UILabel()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        nameLabel.textAlignment = .left
        nameLabel.font = UIFont.boldSystemFont(ofSize: 30)
        nameLabel.backgroundColor = .clear
        
        
        highscoreLabel.textAlignment = .left
        highscoreLabel.font = UIFont.boldSystemFont(ofSize: 16)
        highscoreLabel.backgroundColor = .clear
        highscoreLabel.textColor = .blue
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(nameLabel)
        contentView.addSubview(highscoreLabel)
    }
    
    override func layoutSubviews() {
        nameLabel.frame = CGRect(x: 50, y: 5, width: 460, height: 30)
        highscoreLabel.frame = CGRect(x: 200, y: 40, width: 460, height: 30)
    }
    
    required init?(coder aDecoder: NSCoder) {
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

}
