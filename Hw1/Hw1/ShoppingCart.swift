//
//  ShoppingCart.swift
//  Hw1
//
//  Created by Berk Kaya on 23.09.2022.
//

import Foundation
class ShoppingCart{
    static var shoppingCartArray:[Product] = []
    
    func addToShoppingCard(item:Product){
        ShoppingCart.shoppingCartArray.append(item)
        print("Urun Sepete Eklendi: ",item.productName)
    }
    
    func showShoppingCartItems(){
        print("Sepetteki ürünler")
        for item in ShoppingCart.shoppingCartArray{
            print(item.productName)
        }
        print("AnaMenuye dönmek icin 'a' harfine basınız ")
        print("Satın almak icin 's' harfine basınız ")
        
        let controller = readLine()
        if(controller == "a"){
            mainMenu()
        }
        if(controller == "s"){
            buyItems()
        }
    }
    
    func buyItems(){
        print("Sepetteki Ürünler Toplami: ")
        var sum : Int = 0
        
        for item in ShoppingCart.shoppingCartArray{
          sum += item.productPrice
        }
        
        print(sum)
        
        print("Satın Almayı onaylamak için 'o' harfine basiniz")
        let controller = readLine()
        if(controller == "o"){
            let balance = Balance()
            balance.decraseBalance(price: sum)
            print("İşlem başarılı kalan bakiye: ")
            print( balance.returnBalance())
            print("Ana menüye dönülüyor..")
            mainMenu()
        }
        
    }
    
}
