//
//  ViewController.swift
//  Configuration
//
//  Created by AlexanderYakovenko on 7/14/17.
//  Copyright © 2017 AlexanderYakovenko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    // MARK: - Properties
    
    @IBOutlet weak var timeLabel: UILabel!
    

    let configurationManager = ConfigurationManager(withConfiguration: Configuration())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timeLabel.text = configurationManager.createAt
        
        
        
        addObserver(self, forKeyPath: #keyPath(configurationManager.configuration.updatedAt), options: [.old, .new], context: nil)
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Actions
    @IBAction func updateConfiguration(sender: UIButton) {
        configurationManager.updateConfiguration()
    }

    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == #keyPath(configurationManager.configuration.updatedAt) {
            timeLabel.text = configurationManager.updateAt
        }
    }
    
    // MARK: - Deinitialisation
    deinit {
        removeObserver(self, forKeyPath: #keyPath( configurationManager.configuration.updatedAt))
    }

}

