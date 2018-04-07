//  Created by Jessica Joseph on 4/7/18.
//  Copyright © 2018 TFH Inc. All rights reserved.

import Firebase
import Foundation

typealias CompletionHandler = (_ status: Bool, _ error: Error?) -> ()
// Database Constants
let DB_BASE = Database.database().reference()
