//
//  MenuViewController.swift
//  TwitterClient
//
//  Created by Kim Toy (Personal) on 4/22/17.
//  Copyright © 2017 Codepath. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    private var profileViewController: UIViewController!
    private var timelineViewController: UIViewController!
    private var mentionsViewController: UIViewController!
    var hamburgerViewController: HamburgerViewController!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        profileViewController = storyboard.instantiateViewController(withIdentifier: "ProfileNavigationController")
        timelineViewController = storyboard.instantiateViewController(withIdentifier: "TweetsNavigationController")
        mentionsViewController = storyboard.instantiateViewController(withIdentifier: "MentionsNavigationController")
        
        hamburgerViewController.contentViewController = timelineViewController
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onClickProfile(_ sender: Any) {
        hamburgerViewController.contentViewController = profileViewController
    }

    @IBAction func onClickTimeline(_ sender: Any) {
        hamburgerViewController.contentViewController = timelineViewController
    }
    
    @IBAction func onClickMentions(_ sender: Any) {
        hamburgerViewController.contentViewController = mentionsViewController
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
