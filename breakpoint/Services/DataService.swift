//  Created by Jessica Joseph on 4/7/18.
//  Copyright © 2018 TFH Inc. All rights reserved.

import Firebase
import Foundation

class DataService {
    static let instance = DataService()
    
    private var _REF_BASE = DB_BASE
    private var _REF_USERS = DB_BASE.child("users")
    private var _REF_GROUPS = DB_BASE.child("groups")
    private var _REF_FEED = DB_BASE.child("feed")
    
    var REF_BASE: DatabaseReference { return _REF_BASE }
    var REF_USERS: DatabaseReference { return _REF_USERS }
    var REF_GROUP: DatabaseReference { return _REF_GROUPS }
    var REF_FEED: DatabaseReference { return _REF_FEED }
    
    func createDatabaseUser(uid: String, userData: Dictionary<String, Any>) {
        REF_USERS.child(uid).updateChildValues(userData)
    }
}
