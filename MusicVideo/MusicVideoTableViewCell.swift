//
//  MusicVideoTableViewCell.swift
//  MusicVideo
//
//  Created by Ravi Bijlani on 6/24/16.
//  Copyright © 2016 ROAR Smart. All rights reserved.
//

import UIKit

class MusicVideoTableViewCell: UITableViewCell {
    
    var video: Videos? {
        didSet {
            updateCell()
        }
    }
    
    
    @IBOutlet weak var musicImage: UIImageView!
    
    @IBOutlet weak var rank: UILabel!
    
    @IBOutlet weak var musicTitle: UILabel!
    
    func updateCell() {
        musicTitle.text = video?.vName
        rank.text = ("\(video!.vRank)")
        musicImage.image = UIImage(named: "image_not_available")
    }
    
    
    
}
