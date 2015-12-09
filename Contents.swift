//: Playground - noun: a place where people can play

import Cocoa

class Shape
{
    var shape = Shape()
    var numberOfSides = 7
    var shapeDescription = shape.simpleDescription()
    
    func simpleDescription() -> String
    {
        return "A shape with \(numberOfSides) sides"
    }
    
}
class NamedShape
{
    var numberOfSides: Int = 0
    var name:String
    
    init(name: String)
    {
        self.name = name
    }
    
    func simpleDescription() -> String
    {
        return "A shape with \(numberOfSides) sides"
    }
    
}
class Square: NamedShape
{
    var sideLength: Double
    
    init(sideLength: Double, name: String)
    {
            self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 4
    }
    
    func area() -> Double
    {
        return sideLength * sideLength
    }
    
    
    ovveride func simpleDescription() -> String
    {
        return "A square with sides of length\(sideLength)."
    }
   }

let test = Square(sideLength: 5.2,name: "my test square")
test.area()
test.simpleDescription()

class EquilateralTriangle: NamedShape
{
    var sideLength: Double = 0.0
    
    
    init(sideLength: Double, name: String)
    {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 3
    }
    var perimeter: Double
    {
        get
        {
            return 3.0 * sideLength
        }
        set
        {
            sideLength = newValue / 3.0
        }
    }


    override func simpleDescription() -> String
    {
        return "An equilateral triangle with side of length \(sideLength)."
    }
}
var triangle = EquilateralTriangle(sideLength: 3.1, name: " a triangle")
print(triangle.perimeter)
triangle.perimeter = 9.9
print(triangle.sideLength)

class TriangleAndSquare
{
    var triangle: EquilateralTriangle
    {
        willSet
        {
            square.sideLength = newValue.sideLength
        }
    }
    var square: Square
    {
        willSet
        {
          triangle.sideLength + newValue.sideLength
        }
    }
    init(size: Double, name: String)
    {
        square = Square(sideLength: size, name: name)
        triangle = EquilateralTriangle(sideLength: size, name: name)
    }
}
var triangleAndSquare = TriangleAndSquare(size: 10, name: "another test shape")
print(triangleAndSquare.square.sideLength)
print(triangleAndSquare.triangle.sideLength)
triangleAndSquare.square = Square(sideLength: 50, name: "larger square")
print(triangleAndSquare.triangle.sideLength)
let optionalSquare: Square? = Square(sideLength: 2.5, name: "optional square")
let sideLength = optionalSquare?.sideLength

enum Rank: Int
{
    case Ace = 1
    case Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten
    case Jack, Queen, King
    func simpleDescription() -> String
    {
        switch self
        {
        case .Ace:
            return "ace"
        case .Jack:
            return "jack"
        case .Queen:
            return "queen"
        case .King:
            return "king"
        default:
            return String(self.rawValue)
        }
    }
}
let ace = Rank.Ace
let aceRawValue = ace.rawValue
if let convertedRank = Rank(rawValue: 3)
{
    let threeDescription = convertedRank.simpleDescription()
}

enum Suit
{
    case Spades, Hearts, Diamonds, Clubs
    func color() -> String
    {
        
        switch self
        {
            case .Spades:
                return "Black"
            case .Clubs:
                return "Black"
            case .Hearts:
                return "Red"
            case .Diamonds:
                return "Red"
        }
    }

    func simpleDescription() -> String {
        switch self {
        case .Spades:
            return "spades"
        case .Hearts:
            return "hearts"
        case .Diamonds:
            return "diamonds"
        case .Clubs:
            return "clubs"
        }
    }
}
let hearts = Suit.Hearts
let heartsDescription = hearts.simpleDescription()



