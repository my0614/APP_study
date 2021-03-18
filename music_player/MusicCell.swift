//
//  MusicCell.swift
//  music_player
//
//  Created by Kim minyoung on 2021/03/18.
//

import UIKit

class MusicCell: UITableViewCell {
    @IBOutlet weak var musicImageView: UIImageView!
    
    @IBOutlet weak var musicTitleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
