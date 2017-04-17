//
//  TweetCell.swift
//  TwitterClient
//
//  Created by Kim Toy (Personal) on 4/15/17.
//  Copyright © 2017 Codepath. All rights reserved.
//

import UIKit

class TweetCell: UITableViewCell {
    
    @IBOutlet weak var tweetAuthorImage: UIImageView!
    @IBOutlet weak var tweetAuthorName: UILabel!
    @IBOutlet weak var tweetAuthorHandle: UILabel!
    @IBOutlet weak var tweetTextLabel: UILabel!
    @IBOutlet weak var tweetTime: UILabel!
    
    var tweet: Tweet! {
        didSet {
            tweetAuthorImage.setImageWith((tweet.author?.profileUrl)!)
            tweetAuthorName.text = tweet.author?.name
            tweetAuthorHandle.text = tweet.author?.handle
            tweetTextLabel.text = tweet.text
            tweetTime.text = tweet.timestampString
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        tweetAuthorImage.layer.cornerRadius = 3
        tweetAuthorImage.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
