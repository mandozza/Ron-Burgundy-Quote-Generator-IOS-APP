//
//  Quotes.swift
//  ron burgundy quote Generator
//
//  Created by Jeremy Josey on 2016-01-26.
//  Copyright © 2016 Jeremy Josey. All rights reserved.
//

import Foundation


class RandomQuotes {
    let quoteArray = ["I love scotch. Scotchy scotch scotch. Here it goes down, down into my belly","Oh, I can barely lift my right arm ’cause I did so many. I don’t know if you heard me counting. I did over a thousand","Baxter, is that you? Baxter! Bark twice if you’re in Milwaukee.","You are a smelly pirate hooker. Why don’t you go back to your home on Whore Island?","It’s so damn hot. Milk was a bad choice","I’m in a glass case of emotion!"]

    func getRandomQuote() -> String {
        
        let arrayCount = UInt32(quoteArray.count)
        let randomNumberUnsigned = arc4random_uniform(arrayCount)
        let randomNumberInt = Int(randomNumberUnsigned)
        
        return quoteArray[randomNumberInt]
    }
}


