//
//  Product.swift
//  Hw1
//
//  Created by Berk Kaya on 23.09.2022.
//

import Foundation

protocol ProductType {
    var productName : String { get }
    var productPrice : Int { get }
    var isSellable : Bool {get}
}


class Product : ProductType {
    static var productList:[Product] = []
    
    var productName: String = ""
    var productPrice: Int = 0
    var isSellable: Bool = false
    var productCode : Int = 0
    
    
    
    init(productName: String?, productPrice: Int?, isSellable: Bool?, productCode: Int?) {
        self.productName = productName!
        self.productPrice = productPrice!
        self.isSellable = isSellable!
        self.productCode = productCode!
    }
    
   static var product1 = Product(productName: "Apple",productPrice: 5,isSellable: true, productCode: 1)
   static var product2 = Product(productName: "Orange",productPrice: 10,isSellable: true, productCode: 2)
   static var product3 = Product(productName: "Watermelon",productPrice: 50,isSellable: true, productCode: 3)
   static var product4 = Product(productName: "Strawberry",productPrice: 100,isSellable: true, productCode: 4)
    
    
    static func addStaticProducts(){
        Product.productList.append(Product.product1)
        Product.productList.append(Product.product2)
        Product.productList.append(Product.product3)
        Product.productList.append(Product.product4)
    }
   
    static func gettingProducts(){
       
         for element in Product.productList{
             print(element.productName, "Urun Kodu: ",element.productCode)
        }
        
        print("Ürünü Sepete Eklemek icin ürün kodunu yazınız")
        let productCode = Int(readLine()!)!
       
        for element in Product.productList{
            if(productCode == element.productCode){
               
                print("Girilen Kod: ",productCode)
                print("ProductCode: ",element.productCode)
                //Shopping carta ekleyecez burada.
                let item = ShoppingCart()
                item.addToShoppingCard(item: element)
               
            }
            else if(productCode != element.productCode){
                continue
            }
        }
        print("AnaMenuye dönmek icin 'a' harfine basınız ")
        print("Sepetteki ürünleri görmek inin 's' harfine basınız")
        let controller = readLine()
        if(controller == "a"){
            mainMenu()
        }
        if(controller == "s"){
            let cart = ShoppingCart()
            cart.showShoppingCartItems()
        }
        
        
    }
    
   
    
}
