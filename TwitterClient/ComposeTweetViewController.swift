//
//  ComposeTweetViewController.swift
//  TwitterClient
//
//  Created by Kim Toy (Personal) on 4/16/17.
//  Copyright © 2017 Codepath. All rights reserved.
//

import UIKit

class ComposeTweetViewController: UIViewController {

    @IBOutlet weak var userProfileImage: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userHandleLabel: UILabel!
    @IBOutlet weak var tweetTextView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        userProfileImage.layer.cornerRadius = 3
        userProfileImage.clipsToBounds = true
        userProfileImage.setImageWith((User._currentUser?.profileUrl)!)
        userNameLabel.text = User._currentUser?.name
        userHandleLabel.text = User._currentUser?.handle
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onClickPostButton(_ sender: UIBarButtonItem) {
        TwitterClient.sharedInstance?.postTweet(tweetText: tweetTextView.text, success:{ (response) in
            self.dismiss(animated: true, completion: nil)
        }, failure: { (error) in
            print("error \(error.localizedDescription)")
        })
    }

    @IBAction func onClickCancel(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
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
