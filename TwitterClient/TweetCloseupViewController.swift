//
//  TweetCloseupViewController.swift
//  TwitterClient
//
//  Created by Kim Toy (Personal) on 4/16/17.
//  Copyright © 2017 Codepath. All rights reserved.
//

import UIKit

class TweetCloseupViewController: UIViewController {
    @IBOutlet weak var authorImage: UIImageView!
    @IBOutlet weak var AuthorNameLabel: UILabel!
    @IBOutlet weak var authorHandle: UILabel!
    @IBOutlet weak var tweetTextLabel: UILabel!
    @IBOutlet weak var tweetTimeLabel: UILabel!
    @IBOutlet weak var replyTextView: UITextView!
    @IBOutlet weak var retweetButton: UIButton!
    @IBOutlet weak var favoriteButton: UIButton!

    var tweet: Tweet!

    override func viewDidLoad() {
        super.viewDidLoad()
        if let url = tweet.author?.profileUrl {
            authorImage.setImageWith(url)
        }
        AuthorNameLabel.text = tweet.author?.name
        authorHandle.text = tweet.author?.handle
        tweetTextLabel.text = tweet.text
        tweetTimeLabel.text = tweet.timestampString
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onClickReply(_ sender: UIButton) {
        TwitterClient.sharedInstance?.reply(originalTweetId: tweet.id!, replyText: replyTextView.text, success: { (response) in
            print("success \(response)")
        }, failure: { (error) in
            print("error \(error)")
        })
    }

    @IBAction func onClickRetweet(_ sender: Any) {
        TwitterClient.sharedInstance?.retweet(tweetId: tweet.id!, success: { (response) in
            print("success \(response)")
            self.retweetButton.setImage(UIImage(named: "retweet-action-on-pressed"), for: UIControlState.normal)
        }, failure: { (error) in
            print("error \(error.localizedDescription)")
        })
    }

    @IBAction func onClickFavorite(_ sender: UIButton) {
        TwitterClient.sharedInstance?.favorite(tweetId: tweet.id!, success: { (response) in
            print("success \(response)")
            self.favoriteButton.setImage(UIImage(named: "like-action-on-pressed"), for: UIControlState.normal)
        }, failure: { (error) in
            print("error \(error.localizedDescription)")
        })
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
