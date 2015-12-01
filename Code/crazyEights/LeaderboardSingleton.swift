//
//  LeaderboardSingleton.swift
//  crazyEights
//
//  Created by Travis Ryder on 2015-10-26.
//  Copyright (c) 2015 Kamal Gill. All rights reserved.
//

class LeaderboardSingleton {
    
    static let sharedInstance = LeaderboardSingleton()
    
    var winCounter:Int = 0
    var loseCounter:Int = 0
    
    var player02WinCounter:Int = 0
    var player02LoseCounter:Int = 0
    
    var player03WinCounter:Int = 0
    var player03LoseCounter:Int = 0
    
    var player04WinCounter:Int = 0
    var player04LoseCounter:Int = 0
    
    init() {
    }
    
    func addWinCount() {
        self.winCounter++
    }
    
    func incrementPlayer02() {
        self.player02WinCounter++
    }
    
    func incrementPlayer03() {
        self.player03WinCounter++
    }
    
    func incrementPlayer04() {
        self.player04WinCounter++
    }
    
    func decrementPlayer02() {
        self.player02LoseCounter++
    }
    
    func decrementPlayer03() {
        self.player03LoseCounter++
    }
    
    func decrementPlayer04() {
        self.player04LoseCounter++
    }
    
    func addLoseCount() {
        self.loseCounter++
    }
    
    
    func getWinCount() -> Int {
        return self.winCounter
    }
    
    func getLoseCount() -> Int {
        return self.loseCounter
    }
    
    func getPlayer02WinCount() -> Int {
        return self.player02WinCounter
    }
    
    func getPlayer02LoseCount() -> Int {
        return self.player03LoseCounter
    }
    
    func getPlayer03WinCount() -> Int {
        return self.player03WinCounter
    }
    
    func getPlayer03LoseCount() -> Int {
        return self.player03LoseCounter
    }
    
    func getPlayer04WinCount() -> Int {
        return self.player04WinCounter
    }
    
    func getPlayer04LoseCount() -> Int {
        return self.player04LoseCounter
    }
    
 
    
   
    
}