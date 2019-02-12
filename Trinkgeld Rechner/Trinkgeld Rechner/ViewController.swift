//
//  ViewController.swift
//  Trinkgeld Rechner
//
//  Created by Timon on 07.02.19.
//  Copyright © 2019 Timon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   
    @IBOutlet weak var eingabeBetragTextField: UITextField!
    
    @IBOutlet weak var prozentLabel: UILabel!
    
    @IBOutlet weak var prozenSliderOutlet: UISlider!
    
    @IBOutlet weak var trinkgeldBetragLabel: UILabel!
    
    @IBOutlet weak var gesamtkostenBetragLabel: UILabel!
    
    
    var essensKosten = 0.0
    var trinkgeldProzent = 0
    var kostenTrinkgeld = 0.0
    var gesamtkosten = 0.0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prozenSliderOutlet.value = 0
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    
   
    @IBAction func prozentSliderAction(_ sender: UISlider) {
        print("Slider Test")
        
        ausrechnenDerKosten()
    }
    
    func ausrechnenDerKosten() {
        if eingabeBetragTextField.text != ""{ // != ungleich
            essensKosten = Double(eingabeBetragTextField.text!)!
            trinkgeldProzent = Int(prozenSliderOutlet.value)
            kostenTrinkgeld = (essensKosten * Double(trinkgeldProzent)) / 100
            gesamtkosten = essensKosten + kostenTrinkgeld
            
            print("Trinkggeld: \(kostenTrinkgeld) und Gesamtkosten sind \(gesamtkosten)")
            
            printUIElements()
        }
    }
    
    func printUIElements() {
        let stringProzent = String(trinkgeldProzent)
        let stringTrinkgeld = String(format: "%.2f", kostenTrinkgeld)
        let stringGesamtkosten = String(format: "%.2f", gesamtkosten)
        
        prozentLabel.text = stringProzent + " %"
        trinkgeldBetragLabel.text = "Trinkgeld: " + stringTrinkgeld + " €"
        gesamtkostenBetragLabel.text = "Gesamkosten: " + stringGesamtkosten + " €"
    
    }
    
    
    @IBAction func prozentButtonTapped(_ sender: UIButton) {
        if sender.titleLabel?.text == "3%" {
            prozenSliderOutlet.value = 3
            prozentLabel.text = "3%"
            
            ausrechnenDerKosten()
        } else if sender.titleLabel?.text == "5%" {
            prozenSliderOutlet.value = 5
            prozentLabel.text = "5%"
            
            ausrechnenDerKosten()
        } else if sender.titleLabel?.text == "7%" {
            prozenSliderOutlet.value = 7
            prozentLabel.text = "7%"
            
            ausrechnenDerKosten()
        } else if sender.titleLabel?.text == "10%" {
        prozenSliderOutlet.value = 10
        prozentLabel.text = "10%"
        
        ausrechnenDerKosten()
        }
    }
}


