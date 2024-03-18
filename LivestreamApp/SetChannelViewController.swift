//
//  SetChannelViewController.swift
//  LivestreamApp
//
//  Created by Priya Chaurasiya on 18/03/24.
//


import Foundation
import UIKit

class SetChannelViewController: UIViewController {

    @IBOutlet weak var channelName: UITextField!
    
    @IBAction func startCall(_ sender: UIButton) {
        if (channelName.text?.isEmpty)! {
            print("Enter Channel Name")
        } else {
            self.performSegue(withIdentifier: "startCall", sender: self)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewController = segue.destination as? VideoCallViewController {
            viewController.channel = channelName.text!
        }
    }
    
}
