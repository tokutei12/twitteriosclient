//
//  ProfileViewController.swift
//  TwitterClient
//
//  Created by Kim Toy (Personal) on 4/22/17.
//  Copyright © 2017 Codepath. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userHandleLabel: UILabel!
    @IBOutlet weak var tweetCountLabel: UILabel!
    @IBOutlet weak var followingCountLabel: UILabel!
    @IBOutlet weak var followersCountLabel: UILabel!
    @IBOutlet weak var homeFeedView: UIView!
    var timelineViewController: UIViewController!

    override func viewDidLoad() {
        super.viewDidLoad()
        userImage.layer.cornerRadius = 3
        userImage.clipsToBounds = true
        if let user = User.currentUser {
            userImage.setImageWith(user.profileUrl!)
            userNameLabel.text = user.name
            userHandleLabel.text = user.handle
            tweetCountLabel.text = String(describing: user.tweetsCount!)
            followingCountLabel.text = String(describing: user.followingCount!)
            followersCountLabel.text = String(describing: user.followersCount!)
        }
        // Do any additional setup after loading the view.
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        timelineViewController = storyboard.instantiateViewController(withIdentifier: "TweetsViewController")
        
        timelineViewController.willMove(toParentViewController: self)
        homeFeedView.addSubview(timelineViewController.view)
        timelineViewController.didMove(toParentViewController: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
