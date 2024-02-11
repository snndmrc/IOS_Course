//
//  FeedCell.swift
//  FirebaseInstaClone
//
//  Created by Sinan Demirci on 11.02.2024.
//

import UIKit

class FeedCell: UITableViewCell {

    @IBOutlet weak var likeLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var userEmailLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func likedButtonClicked(_ sender: Any) {
    }
    

}
