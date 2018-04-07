//  Created by Jessica Joseph on 4/7/18.
//  Copyright © 2018 TFH Inc. All rights reserved.

import UIKit

class AuthController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signinWithEmailPressed(_ sender: Any) {
        let loginController = storyboard?.instantiateViewController(withIdentifier: "loginSB")
        present(loginController!, animated: true, completion: nil)
    }
    
    @IBAction func signinWithGooglePressed(_ sender: Any) {
    }
    
    @IBAction func signinWithFacebookPressed(_ sender: Any) {
    }
    
}
