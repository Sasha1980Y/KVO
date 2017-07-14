//
//  ConfigurationManager.swift
//  Configuration
//
//  Created by AlexanderYakovenko on 7/14/17.
//  Copyright © 2017 AlexanderYakovenko. All rights reserved.
//

import UIKit

class ConfigurationManager: NSObject {
    
    
    // MARK: - Properties
    var configuration = Configuration()
    
    // MARK: -
    lazy private var dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy:MM:dd HH:mm:ss"
        return dateFormatter
    }()
    
    // MARK: - 
    var createAt: String {
        return dateFormatter.string(from: configuration.createAt)
    }
    var updateAt: String {
        return dateFormatter.string(from: configuration.updatedAt)
        
    }

    // MARK: Initialisation
    init(withConfiguration configuration: Configuration) {
        self.configuration = configuration
        
        super.init()
    }
    
    //MARK: - Public Interface
    
    func updateConfiguration() {
        configuration.updatedAt = Date()
    }
    
    
    
}
