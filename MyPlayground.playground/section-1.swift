// Playground - noun: a place where people can play

import UIKit

import CoreGraphics

var str = "Hello, playground"

str = "Hi"


var names:[String] = ["jim","sue"]


names += ["tom", "same"]

var info: [String:AnyObject] = ["name":"jo","age":31,"books": [["title":"monster"]]]


////// double
////// does not work with CGFloat
var num = 0


var shapes = ["jim","sue"]
for shape in shapes {
    
    
}


/////// closed range operator 0 - 5
for i in 0...5 {
    
    
}



//////// half open range - one less of items in arrary...3 items in arrary, this performs 0-2
for i in 0..<shapes.count {
    
    println(shapes[i])
}

/////// enumerate for arrarys
for (i,shape) in enumerate(shapes) {
    
    var shapeInfo = "\(i) \(shape) in\(info)"
    
   // println(shapeInfo)
    
}

var myInfo = ["name":"jo","age":"31","brand":"nike"]

// key, value could be anything but it would be type "key" and "value" which ever name you pick
for (key,value) in myInfo {
    
    if key == "age" {
        
        println("\(key) = \(value)")
        
        println("my age is  \(value)")
    
    }
    
    switch  key {
        
    case "age":
            
        println("my age is  \(value)")
        
    case "name":
            
        println("my age is  \(value)")
        
    default:
        
        println("my age is  \(value)")
    }
    
        
    var number:Int = 0
    var isTrue: Bool = true
    
}

var shoppingList = ["catfish", "water", "tulips", "blue paint"]

shoppingList[1]

var occupations = ["Malcolm": "Captain",
                    "Kaylee": "Mechanic",


]

occupations["Jayne"] = "Public Relations"







    
func calculateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
    
    var min = scores[0]
    var max = scores[0]
    var sum = 0
    
    for score in scores {
        
        if score > max {
            
            max = score
            
        }else if score < min {
            
            min = score
            
        }
        
        sum += score
    }
    
    println(scores)
    
    return (min, max, sum)
    
    
}

let statistics = calculateStatistics([5, 3, 100, 3, 9])

statistics.sum
statistics.2

var optionalName: String? = nil
var greeting = "Hello!"

if let name = optionalName  {
    
    greeting = "Hello, \(name)"
}else {
    
    optionalName = "hey, hey"
    
}



