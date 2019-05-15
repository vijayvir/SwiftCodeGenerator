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

### For codable 
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
