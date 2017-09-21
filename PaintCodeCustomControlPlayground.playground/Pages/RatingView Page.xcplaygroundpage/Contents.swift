//: [Previous](@previous)

/*: some text
### RatingView Page
*/
//#-hidden-code
import UIKit
import PlaygroundSupport
//#-end-hidden-code

let ratingView = RatingView(frame: CGRect(x: 0.0, y: 0.0, width: 250, height: 250))

ratingView.border = 5
ratingView.radius = 5
ratingView.ratingValue = 2
ratingView.label = "🌧☁️⛅️🌤☀️"
ratingView.label = "🇩🇪🇩🇪🇩🇪🇩🇪🇩🇪"
ratingView.label.characters.count
// swift 3 string count fix
// ratingView.label = "🇩🇪🇩🇪🇩🇪🇩🇪🇩🇪\u{200B}\u{200B}\u{200B}\u{200B}"
// ratingView.label.characters.count
PlaygroundPage.current.liveView = ratingView
PlaygroundPage.current.needsIndefiniteExecution = true
//: [Next](@next)
