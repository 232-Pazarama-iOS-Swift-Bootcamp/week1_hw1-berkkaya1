/*
 Ödev Hakkında Bazı Notlar:
 
 1- Swift diline yeni adapte olduğum için bir miktar zorlandım, kod bayağı spagetti oldu ama terminal uygulamasının getirdiği kısıtlamaların da bunda payı büyük.
 2- Genel olarak struct, class, protokol (inheritance) ve optionals gibi konuları kullanmaya çalıştım ancak üzerine çalışmam ve daha çok pratik yapmam gerekiyor.
 3- Belirtilen bazı özellikleri (meslek ve yaşa göre ürün çıkarma vs) koymadım daha fazla if else ekleyip kodu daha karmaşık hale getirmek istemedim bunun yerine temel fonksiyonlara odaklandım.
 
 Bug: Satın alma işlemi sonrası sepetteki ürünler silinmiyor ama satın almaya bir daha basınca
 bakiye azalmıyor (yeni ürün ekleyip denedikten sonra çalışıyor.)
 
 */

import Foundation

var name : String?, password : String?
var index : Int?

Product.addStaticProducts()

func mainMenu(){
    if(name != nil && password != nil){
        print("----------------------------------")
        print("Urunleri Gormek icin 1 tusuna bas")
        print("Bakiye Sorgulamak icin 2 tusuna bas")
        print("Sepete gitmek icin 3 tusuna bas")
        print("---------------------------------")
        
        let index = Int(readLine()!)
        var flag = true
        
        while ( flag == true ){
            switch (index){
            case (1):
                Product.gettingProducts()
                flag = false
                
            case(2):
                balanceCheck()
                flag = false
                
            case(3):
                let cart = ShoppingCart()
                cart.showShoppingCartItems()
                flag = false
                
            default:
                break
            
            }
        }
    }
    
}

func register(){
    print("Terminal Markete Hosgediniz Lutfen Menuyu Gormek İcin Kayit Olunuz")
    print("Kullanici Adi: ")
    name = readLine()
    print("Sifreniz: ")
    password = readLine()
    
    let user = Register(name: name,password: password)
    print(user)
}
func balanceCheck(){
    let balance = Balance()
    print("Kalan Bakiyeniz: ")
    balance.returnBalance()

    print("AnaMenuye donmek icin 'a' tusuna basın")
    print("Para Eklemek icin 'e' tusuna basin")
    
    let option = readLine()
    if(option=="a"){
        mainMenu()
    }
    if(option == "e"){
        print("Eklemek istediniz bakiyeyi yaziniz")
        guard let bakiye = Int(readLine()!) else {
            print("Hatali Sayi Girdiniz lütfen tekrar deneyiniz")
            return mainMenu()
        }
        balance.increaseBalance(price: bakiye)
        print("Para Eklendi Yeni Bakiyeniz: ")
        balance.returnBalance()
        print("Ana Menüye Dönülüyor...")
        mainMenu()
        
        
    }
    
    
    
}
    
register()
mainMenu()
