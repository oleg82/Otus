//
//  BenchmarkCell.swift
//  Otus
//
//  Created by Олег Иванов on 13/06/2019.
//  Copyright © 2019 Олег Иванов. All rights reserved.
//

import UIKit

class BenchmarkCell: UICollectionViewCell {

    static let reuseID = String(describing: BenchmarkCell.self)
    static let nib = UINib(nibName: String(describing: BenchmarkCell.self), bundle: nil)
    
    @IBOutlet private weak var stackView: UIStackView!
    @IBOutlet private weak var timerImageView: UIImageView!
    @IBOutlet private weak var dateLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        backgroundColor = .white
        clipsToBounds = true
        layer.cornerRadius = 6
        dateLabel.font = UIFont.systemFont(ofSize: 17)
        dateLabel.textAlignment = .center
    }
    
    func update(date: String, isRun: Bool) {
        if isRun {
            timerImageView.image = UIImage.init(named: "stop")
        } else {
            timerImageView.image = UIImage.init(named: "run")
        }
        dateLabel.text = date
    }
}
