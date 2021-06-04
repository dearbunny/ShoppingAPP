//
//  ViewController.swift
//  Shopping APP 生鮮雜貨
//
//  Created by Rose on 2021/6/3.
//

import UIKit

class ViewController: UIViewController {
    
    // 數量
    @IBOutlet weak var appleQtyTextField: UILabel!
    @IBOutlet weak var bananaQtyTextField: UILabel!
    @IBOutlet weak var pepperQtyTextField: UILabel!
    @IBOutlet weak var gingerQtyTextField: UILabel!
    
    @IBOutlet weak var cocaQtyTextField: UILabel!
    @IBOutlet weak var dietQtyTextField: UILabel!
    @IBOutlet weak var spriteQtyTextField: UILabel!
    @IBOutlet weak var pepsiQtyTextField: UILabel!
    @IBOutlet weak var appleJuiceQtyTextField: UILabel!
    
    
    // 價格
    @IBOutlet weak var applePriceTextField: UILabel!
    @IBOutlet weak var bananaPriceTextField: UILabel!
    @IBOutlet weak var pepperPriceTextField: UILabel!
    @IBOutlet weak var gingerPriceTextField: UILabel!
    
    @IBOutlet weak var cocaPriceTextField: UILabel!
    @IBOutlet weak var dietPriceTextField: UILabel!
    @IBOutlet weak var spritePriceTextField: UILabel!
    @IBOutlet weak var pepsiPriceTextField: UILabel!
    @IBOutlet weak var appleJuicePriceTextField: UILabel!
    
    
    
    // Stepper
    @IBOutlet weak var appleStepper: UIStepper!
    @IBOutlet weak var bananaStepper: UIStepper!
    @IBOutlet weak var pepperStepper: UIStepper!
    @IBOutlet weak var gingerStepper: UIStepper!
    
    @IBOutlet weak var cocaStepper: UIStepper!
    @IBOutlet weak var dietStepper: UIStepper!
    @IBOutlet weak var spriteStepper: UIStepper!
    @IBOutlet weak var pepsiStepper: UIStepper!
    @IBOutlet weak var appleJuiceStepper: UIStepper!
    
    
    // 分類
    @IBOutlet weak var typeTextField: UILabel!
    @IBOutlet weak var fruitsBtn: UIButton!
    @IBOutlet weak var beveragesBtn: UIButton!
    
    @IBOutlet weak var bakeryBtn: UIButton!
    @IBOutlet weak var fruitsScrollView: UIScrollView!
    @IBOutlet weak var beveragesScrollView: UIScrollView!
    
    @IBOutlet weak var totalLabel: UILabel!
    
    var itemApple:Int = 0
    var itemBanana:Int = 0
    var itemPepper:Int = 0
    var itemGinger:Int = 0
    
    var itemCoca:Int = 0
    var itemDiet:Int = 0
    var itemSprite:Int = 0
    var itemPepsi:Int = 0
    var itemAppleJuice:Int = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // 設定價格
        applePriceTextField.text = "4.99"
        bananaPriceTextField.text = "4.99"
        pepperPriceTextField.text = "4.99"
        gingerPriceTextField.text = "4.99"
        cocaPriceTextField.text = "4.99"
        dietPriceTextField.text = "1.99"
        spritePriceTextField.text = "1.50"
        pepsiPriceTextField.text = "4.99"
        appleJuicePriceTextField.text = "15.99"
        
        // 預設分類
        fruitsScrollView.isHidden = false
        beveragesScrollView.isHidden = true
        typeTextField.text = "Frash Fruits & Vegetable"
        
    }
    
    @IBAction func changeQty(_ sender: UIStepper) {
        //把Stepper數字顯示到Qty上
        itemApple = Int(appleStepper.value)
        itemBanana = Int(bananaStepper.value)
        itemPepper = Int(pepperStepper.value)
        itemGinger = Int(gingerStepper.value)
        
        itemCoca = Int(cocaStepper.value)
        itemDiet = Int(dietStepper.value)
        itemSprite = Int(spriteStepper.value)
        itemPepsi = Int(pepsiStepper.value)
        itemAppleJuice = Int(appleJuiceStepper.value)
       
        appleQtyTextField.text = String(itemApple)
        bananaQtyTextField.text = String(itemBanana)
        pepperQtyTextField.text = String(itemPepper)
        gingerQtyTextField.text = String(itemGinger)
        
        cocaQtyTextField.text = String(itemCoca)
        dietQtyTextField.text = String(itemDiet)
        spriteQtyTextField.text = String(itemSprite)
        pepsiQtyTextField.text = String(itemPepsi)
        appleJuiceQtyTextField.text = String(itemAppleJuice)
        
        calculate()
    }
    // 刪除
    @IBAction func clearAll(_ sender: UIButton) {
        appleStepper.value = 0
        bananaStepper.value = 0
        pepperStepper.value = 0
        gingerStepper.value = 0
        cocaStepper.value = 0
        dietStepper.value = 0
        spriteStepper.value = 0
        pepsiStepper.value = 0
        appleJuiceStepper.value = 0
        
        appleQtyTextField.text = "0"
        bananaQtyTextField.text = "0"
        pepperQtyTextField.text = "0"
        gingerQtyTextField.text = "0"
        cocaQtyTextField.text = "0"
        dietQtyTextField.text = "0"
        spriteQtyTextField.text = "0"
        pepsiQtyTextField.text = "0"
        appleJuiceQtyTextField.text = "0"
        
        totalLabel.text = "0"
    }
    
    //顯示水果分類
    @IBAction func showFruits(_ sender: UIButton) {
        fruitsScrollView.isHidden = false
        beveragesScrollView.isHidden = true
        typeTextField.text = "Frash Fruits & Vegetable"
    }
    // 顯示飲料
    @IBAction func showBeverages(_ sender: UIButton) {
        fruitsScrollView.isHidden = true
        beveragesScrollView.isHidden = false
        typeTextField.text = "Beverages"
    }
    
    
    
    // 金額計算
    func calculate() {
        // 字串轉數字
        let applePrice = Float(applePriceTextField.text!)!
        let bananaPrice = Float(bananaPriceTextField.text!)!
        let pepperPrice = Float(pepperPriceTextField.text!)!
        let gingerPrice = Float(gingerPriceTextField.text!)!
        
        let cocaPrice = Float(cocaPriceTextField.text!)!
        let dietPrice = Float(dietPriceTextField.text!)!
        let spritePrice = Float(spritePriceTextField.text!)!
        let pepsiPrice = Float(pepsiPriceTextField.text!)!
        let appleJuicePrice = Float(appleJuicePriceTextField.text!)!
        
        
      
        // 總計 金額*數量
        let sum = applePrice * Float(itemApple) + bananaPrice * Float(itemBanana) + pepperPrice * Float(itemPepper) + gingerPrice * Float(itemGinger) +
            cocaPrice * Float(itemCoca) + dietPrice * Float(itemDiet) + spritePrice * Float(itemSprite) + pepsiPrice * Float(itemPepsi) + appleJuicePrice * Float(itemAppleJuice)
        // 取小數第二位
        //let sumString: String! = String(format: "%.2f", sum)
        // totalLabel.text = sumString
        
        // 數字轉金錢格式
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        let moneyString = formatter.string(from: NSNumber(value: sum))
        
        //小數後二位
//        formatter.maximumFractionDigits = 2
//        moneyString = formatter.string(from: NSNumber(value: sum))
        
        totalLabel.text = "\(moneyString!)"
    }

    
    

}

