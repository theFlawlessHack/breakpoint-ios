//  Created by Jessica Joseph on 4/7/18.
//  Copyright © 2018 TFH Inc. All rights reserved.

import Firebase
import Foundation

class AuthService {
    static let instance = AuthService()
    
    func registerUser(withEmail email:String, andPassword password:String, completion:@escaping CompletionHandler) {
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            guard let user = user else {
                completion(false, error)
                return
            }
            
            let userData = ["provider": user.providerID, "email": user.email]
            DataService.instance.createDatabaseUser(uid: user.uid , userData: userData)
            completion(true, nil)
        }
    }
    
    func loginUser(withEmail email:String, andPassword password:String, completion:@escaping CompletionHandler) {
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            if error != nil  {
                completion(false, error)
                return
            }
            
            completion(true, nil)
        }
    }
}
