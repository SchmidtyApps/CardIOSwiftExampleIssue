//
//  ViewController.swift
//  CardIOSwiftExample
//
//  Created by Michael Schmidt on 10/18/17.
//  Copyright © 2017 Example. All rights reserved.
//

import UIKit

class ViewController: UIViewController, CardIOPaymentViewControllerDelegate {
    @IBOutlet weak var outputLabel: UILabel!
    
    @IBAction func scanCard(_ sender: UIButton) {
        guard let cardIOVC = CardIOPaymentViewController(paymentDelegate: self) else { return }
        cardIOVC.collectCardholderName = true
        cardIOVC.hideCardIOLogo = true
        cardIOVC.collectCVV = true
        cardIOVC.modalPresentationStyle = .currentContext
        present(cardIOVC, animated: true)
    }

    @objc func userDidCancel(_ paymentViewController: CardIOPaymentViewController!) {
        outputLabel.text = "User has canceled the scanner."
        paymentViewController.dismiss(animated: true, completion: nil)
    }
    
    @objc func userDidProvide(_ cardInfo: CardIOCreditCardInfo!, in paymentViewController: CardIOPaymentViewController!) {
        if let info = cardInfo {
            let str = String(format: "Received card info.\n Cardholders Name: %@ \n Number: %@\n expiry: %02lu/%lu\n cvv: %@.", info.cardholderName, info.redactedCardNumber, info.expiryMonth, info.expiryYear, info.cvv)
            outputLabel.text = str
        } else {
            outputLabel.text = "No card info received"
        }
        
        paymentViewController.dismiss(animated: true, completion: nil)
    }
}

