//: [Previous](@previous)

import UIKit
import PlaygroundSupport

let ratingControl = RatingControl(frame: CGRect(x: 0.0, y: 0.0, width: 500, height: 80))
ratingControl.ratingValue = 3
ratingControl.label = "🌧☁️⛅️🌤☀️"

PlaygroundPage.current.liveView = ratingControl
PlaygroundPage.current.needsIndefiniteExecution = true

//: [Next](@next)
