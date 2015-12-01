//
//  SettingsSingleton.swift
//  crazyEights
//
//  Created by Kamal Gill on 2015-11-17.
//  Copyright (c) 2015 Kamal Gill. All rights reserved.
//

class SettingsSingleton {
    
    static let sharedInstance = SettingsSingleton()
    
    var difficulty:String = "Normal"
    var numOfPlayers:String = "2"
    var font:String = "Helvetica"
    var theme:String = "Original"
    var player01Name:String = "Player 01"
    var player02Name:String = "Player 02"
    var player03Name:String = "Player 03"
    var player04Name:String = "Player 04"
    
    init() {
    }
    
    var difficultySelector: String {
        get {
            return self.difficulty
        }
        
        set(difficulty) {
            self.difficulty = difficulty
        }
    }
    
    var numberOfPlayers: String {
        get {
            return self.numOfPlayers
        }
        
        set(numOfPlayers) {
            self.numOfPlayers = numOfPlayers
        }
    }
    
    var fontSelector: String {
        get {
            return self.font
        }
        
        set(font) {
            self.font = font
        }
    }
    
    var themeSelector: String {
        get {
            return self.theme
        }
        
        set(theme) {
            self.theme = theme
        }
    }
    
    var player01: String {
        get {
            return self.player01Name
        }
        
        set(player01Name) {
            self.player01Name = player01Name
        }
    }
    
    var player02: String {
        get {
            return self.player02Name
        }
        
        set(player02Name) {
            self.player02Name = player02Name
        }
    }
    
    var player03: String {
        get {
            return self.player03Name
        }
        
        set(player03Name) {
            self.player03Name = player03Name
        }
    }
    
    var player04: String {
        get {
            return self.player04Name
        }
        
        set(player04Name) {
            self.player04Name = player04Name
        }
    }


    
    
}
