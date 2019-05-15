# SwiftCodeGenerator
This simple code genrate the swift code from swift object . Mainly you can use this class to make model  classes for your Server Api's  or other Swift json object . 

### How to use this 

    • 1 Add class  `LeoSwiftCoder` in your code 
    •2 It is very simple to use just pass swift object to class , It will print the `swift code` in console . 

```swift 
let swiftCoder = LeoSwiftCoder()
swiftCoder.leoClassMake(withName: "UserMessages", json: json)
print("Enjoy the Code ")
```

## For codable 
```swift 
let some = SomeDstct(name: "name",
age: 34,
className: "eeee",
other: SomeDstct.SomeOther(color: "d",
size: "dd",
height: 3232))

let generator = LeoSwiftCoder().withTemplate(LeoSwiftCoder.CodeTemplate.Codeable)
generator.leoClassMake(withName: "Temp", json: some.toJsonObect())

```
it will generate following output 
```swift 
class Temp : Codable {
var serverData : [String: Any] = [:]
var age : Int?
var className : String?
var name : String?
var other : Other?
enum CodingKeys: String, CodingKey {
case age = "age"
case name = "name"
case other = "other"
case className = "className"
}
required init(from decoder: Decoder) throws {
let containerL = try decoder.container(keyedBy: CodingKeys.self)
age = try containerL.decodeIfPresent(Int.self, forKey: .age)
name = try containerL.decodeIfPresent(String.self, forKey: .name)
other = try containerL.decodeIfPresent(Other.self, forKey: .other)
className = try containerL.decodeIfPresent(String.self, forKey: .className)
}
class Other : Codable {
var serverData : [String: Any] = [:]
var color : String?
var height : Int?
var size : String?
enum CodingKeys: String, CodingKey {
case size = "size"
case color = "color"
case height = "height"
}
required init(from decoder: Decoder) throws {
let containerL = try decoder.container(keyedBy: CodingKeys.self)
size = try containerL.decodeIfPresent(String.self, forKey: .size)
color = try containerL.decodeIfPresent(String.self, forKey: .color)
height = try containerL.decodeIfPresent(Int.self, forKey: .height)
}
}
}
```
