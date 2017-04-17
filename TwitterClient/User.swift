//
//  User.swift
//  TwitterClient
//
//  Created by Kim Toy (Personal) on 4/15/17.
//  Copyright © 2017 Codepath. All rights reserved.
//

import UIKit

class User: NSObject {
    var name: String?
    var screenname: String?
    var handle: String?
    var profileUrl: URL?
    var tagline: String?
    var dictionary: Dictionary<String, Any>?

    static let userLogoutNotificationKey = "UserDidLogout"

    init(dictionary: Dictionary<String, Any>) {
        self.dictionary = dictionary as Dictionary?
        
        name = dictionary["name"] as? String
        
        screenname = dictionary["screen_name"] as? String
        handle = "@\(screenname!)"
        
        let profileUrlString = dictionary["profile_image_url_https"] as? String
        if let urlString = profileUrlString {
            profileUrl = URL(string: urlString)
        }
        
        tagline = dictionary["description"] as? String
    }
    
    static var _currentUser: User?
    
    class var currentUser: User? {
        get {
            if _currentUser == nil {
                let defaults = UserDefaults.standard
                let userData = defaults.object(forKey: "currentUser") as? Data
                if let userData = userData {
                    let dictionary = try! JSONSerialization.jsonObject(with: userData, options: []) as! Dictionary<String, Any>
                    _currentUser = User(dictionary: dictionary)
                }
            }
            return _currentUser
        }
        
        set(user) {
            _currentUser = user
            let defaults = UserDefaults.standard
            if let user = user {
                let data = try! JSONSerialization.data(withJSONObject: user.dictionary!, options: [])
                defaults.set(data, forKey: "currentUser")
            } else {
                defaults.removeObject(forKey: "currentUser")
            }
            defaults.synchronize()
        }
    }
}
