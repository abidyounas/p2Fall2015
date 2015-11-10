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
    
    
    init() {
    }
    
    func addWinCount() {
        self.winCounter++
    }
    
    func addLoseCount() {
        //self.winCounter--
        self.loseCounter++
    }
    
    func getWinCount() -> Int {
        return self.winCounter
    }
    
    func getLoseCount() -> Int {
        return self.loseCounter
    }
    
}