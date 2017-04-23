//
//  TwitterClient.swift
//  TwitterClient
//
//  Created by Kim Toy (Personal) on 4/15/17.
//  Copyright © 2017 Codepath. All rights reserved.
//

import UIKit
import BDBOAuth1Manager

class TwitterClient: BDBOAuth1SessionManager {
    
    static let sharedInstance = TwitterClient(baseURL: URL(string: "https://api.twitter.com")!, consumerKey: "svsF80GXie8T4jo8tyq7bSm3R", consumerSecret: "Omt5swB3kPbTA9j8t0tKHfsLz0iP2XtKNuSLl2LZc9vtIEb9LT")
    
    var loginSuccess: (() -> ())?
    var loginFailure: ((Error) -> ())?
    
    func login(success: @escaping () -> (), failure: @escaping (Error) -> ()) {
        self.loginSuccess = success
        self.loginFailure = failure
        TwitterClient.sharedInstance?.deauthorize()

        TwitterClient.sharedInstance?.fetchRequestToken(withPath: "oauth/request_token", method: "GET", callbackURL: URL(string: "twitterclient://oauth"), scope: nil, success: { (requestToken) in
            let token = requestToken!.token as String
            let url = URL(string: "https://api.twitter.com/oauth/authorize?oauth_token=\(token)")
            UIApplication.shared.openURL(url!)
        }, failure: { (error) in
            print("error: \(error?.localizedDescription)")
            self.loginFailure?(error!)
        })
    }

    func handleOpenUrl (url: URL){
        let requestToken = BDBOAuth1Credential(queryString: url.query)
        TwitterClient.sharedInstance?.fetchAccessToken(withPath: "oauth/access_token", method: "POST", requestToken: requestToken, success: { (accessToken) in
            self.currentAccount(success: { (user: User) in
                User.currentUser = user
                self.loginSuccess?()
            }, failure: { (error: Error) in
                self.loginFailure?(error)
            })
        }, failure: { (error) in
            print(error?.localizedDescription ?? "no error")
            self.loginFailure?(error!)
        })
    }

    func loadHomeTimeline(success: @escaping ([Tweet]) -> (), failure: @escaping (Error) -> ()) {
        get("1.1/statuses/home_timeline.json", parameters: nil, progress: nil, success: { (task, response) in
            print(response)
            let tweets = Tweet.tweetsWithArray(dictionaries: response as! [Dictionary<String, Any>])
            success(tweets)
        }, failure: { (task, error) in
            failure(error)
        })
    }

    func loadMentions(success: @escaping ([Tweet]) -> (), failure: @escaping (Error) -> ()) {
        get("1.1/statuses/mentions_timeline.json", parameters: nil, progress: nil, success: { (task, response) in
            let tweets = Tweet.tweetsWithArray(dictionaries: response as! [Dictionary<String, Any>])
            success(tweets)
        }, failure: { (task, error) in
            failure(error)
        })
    }

    func currentAccount(success: @escaping (User) -> (), failure: @escaping (Error) -> ()) {
        get("1.1/account/verify_credentials.json", parameters: nil, progress: nil, success: { (task, response) in
            let user = User(dictionary: response as! Dictionary<String, Any>)
            success(user)
        }, failure: { (task, error) in
            failure(error)
        })
    }
    
    func postTweet(tweetText: String, success: @escaping (Any?) -> (), failure: @escaping (Error) -> ()) {
        post("1.1/statuses/update.json", parameters: ["status": tweetText], progress: nil, success: { (task, response) in
            success(response)
        }, failure: { (task, error) in
            failure(error)
        })
    }
    
    func reply(originalTweetId: Int64, replyText: String, success: @escaping (Any?) -> (), failure: @escaping (Error) -> ()) {
        post("1.1/statuses/update.json", parameters: ["status": replyText, "in_reply_to_status_id": originalTweetId], progress: nil, success: { (task, response) in
            success(response)
        }, failure: { (task, error) in
            failure(error)
        })
    }

    func retweet(tweetId: Int64, success: @escaping (Any?) -> (), failure: @escaping (Error) -> ()) {
        post("1.1/statuses/retweet/\(tweetId).json", parameters: nil, progress: nil, success: { (task, response) in
            success(response)
        }) { (task, error) in
            failure(error)
        }
    }
    
    func favorite(tweetId: Int64, success: @escaping (Any?) -> (), failure: @escaping (Error) -> ()) {
        post("1.1/favorites/create.json", parameters: ["id": tweetId], progress: nil, success: { (task, response) in
            success(response)
        }) { (task, error) in
            failure(error)
        }
    }
    
    func logout() {
        print("called twitter client logout")
        User.currentUser = nil
        deauthorize()
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: User.userLogoutNotificationKey), object: nil)
    }

}
