//
//  Tweet.swift
//  TwitterClient
//
//  Created by Kim Toy (Personal) on 4/15/17.
//  Copyright © 2017 Codepath. All rights reserved.
//

import UIKit

class Tweet: NSObject {
    var text: String?
    var timestamp: Date?
    var timestampString: String?
    var retweetCount: Int = 0
    var favoritesCount: Int = 0
    var author: User?
    
    init(dictionary: Dictionary<String, Any>) {
        text = dictionary["text"] as? String
        retweetCount = (dictionary["retweet_count"] as? Int) ?? 0
        favoritesCount = (dictionary["favourites_count"] as? Int) ?? 0
        timestampString = dictionary["created_at"] as? String

        if let timestampString = timestampString {
            let formatter = DateFormatter()
            formatter.dateFormat = "EEE MMM d HH:mm:ss Z y"
            timestamp = formatter.date(from: timestampString)
        }
        
        let userDictionary = dictionary["user"] as? Dictionary<String, Any>

        if let userDictionary = userDictionary {
            author = User(dictionary: userDictionary)
        }
    }
    
    class func tweetsWithArray(dictionaries: [Dictionary<String, Any>]) -> [Tweet] {
        var tweets = [Tweet]()
        
        for dictionary in dictionaries {
            let tweet = Tweet(dictionary: dictionary)
            tweets.append(tweet)
        }
        
        return tweets
    }
}
