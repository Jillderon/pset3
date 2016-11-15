//
//  CustomMovieCell.swift
//  pset3
//
//  Created by Jill de Ron on 15-11-16.
//  Copyright © 2016 Jill de Ron. All rights reserved.
//

import UIKit

class CustomMovieCell: UITableViewCell {

    @IBOutlet weak var descriptionMovie: UILabel!
    @IBOutlet weak var nameMovie: UILabel!
    @IBOutlet weak var poster: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
