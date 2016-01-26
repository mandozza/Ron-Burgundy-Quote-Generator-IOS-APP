//
//  ViewController.swift
//  ron burgundy quote Generator
//
//  Created by Jeremy Josey on 2016-01-22.
//  Copyright © 2016 Jeremy Josey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    @IBOutlet weak var lblQuote: UILabel!
    @IBOutlet weak var btnGetQuote: UIButton!
    
    let quote = RandomQuotes()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        btnGetQuote.center.y += 30.0
        btnGetQuote.alpha = 0.0
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        //animate factButton with springs
        UIView.animateWithDuration(1.0, delay: 0.5, usingSpringWithDamping: 0.3, initialSpringVelocity: 0, options: [], animations: {
            self.btnGetQuote.center.y -= 30.0
            self.btnGetQuote.alpha = 1.0
            }, completion: nil)
        
    }



    @IBAction func btnGetRandomQuote(sender: AnyObject) {
        
        
        let b = self.btnGetQuote.bounds
        
        UIView.animateWithDuration(0.2, delay: 0.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 3, options: [], animations: {
            
            //Grow the btnGetQuote wider when pressed
            self.btnGetQuote.bounds = CGRect(x: b.origin.x, y: b.origin.y, width: b.size.width + 30, height: b.size.height + 10)
            
            
            }, completion: {_ in
                
                self.showFact()
                
                //Shrink btnGetQuote back to original size after grow is complete
                self.btnGetQuote.bounds = CGRect(x: b.origin.x, y: b.origin.y, width: b.size.width, height: b.size.height)
        })
        
    }
    
    
    func showFact() {
        UIView.animateWithDuration(0.33, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 0, options: [], animations: {
            
            
            }, completion: {_ in
                
                //bring back the view to its original position and make it hidden, and then use transition to introduce the banner on screen as if it were a new element being put on
                //Accessing the messageArray via our instance var "messages" and function "randomMessage" in the Message class and setting the text to the label, hide the banner, move the banner off the screen
                
                self.lblQuote.text = self.quote.getRandomQuote()
                self.lblQuote.hidden = true
             
                
                UIView.transitionWithView(self.lblQuote, duration: 0.7, options: [.CurveEaseOut, UIViewAnimationOptions.TransitionFlipFromTop] , animations: {
                    self.lblQuote.hidden = false
                    
                    
                    }, completion: nil)
        })
    }
    
    
    

}

