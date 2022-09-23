//
//  Balance.swift
//  Hw1
//
//  Created by Berk Kaya on 23.09.2022.
//

import Foundation

class Balance{
    
    var userBalance = 1000;
    
    func returnBalance() -> Int{
        return userBalance
    }

    func decraseBalance(price:Int){
        userBalance -=  price
    }

    func increaseBalance(price:Int){
        userBalance += price
    }
}


