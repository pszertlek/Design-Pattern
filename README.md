# Design-Pattern
Design-Pattern

### 六大设计原则

###### 单一职责原则(Single Responsibility Priciple)
>.定义 : 应该有且只有一个原因引起类的变化


1.类的复杂性降低，一个类只有一个职责，类比较清晰。

2.可读性、可维护性提高。

3.变更引起的风险降低。


###### 里氏替换原则(Liskov Substitution Principle, 简称LSP)
>.定义：所有定义应用基类的地方都可以透明地用子类来替换。

###### 依赖倒置原则(Dependence Inversion Principle, DIP)

>.定义：模块间的依赖通过抽象发生，实现类之间不发生直接的依赖关系，其依赖关系通过接口或抽象类产生；接口和抽象类不依赖于实现类；实现类依赖接口与抽象。更加精简的定义就是面向接口编程。

1. 每个类尽量都有接口或抽象类。

2. 变量的表面类型尽量是接口或者是抽象类。
3. 任何类都不应该从具体类派生。
4. 尽量不要覆写基类的方法。
5. 结合里氏替换则使用。

###### 接口隔离原则
>.定义：客户端不应该依赖它不需要的接口，类的依赖关系应该建立在最少的接口上。

###### 迪米特法则(Law of Demeter, LoD)
>.定义：一个对象应该对其他对象有最少的了解。

###### 开闭原则(Open Closed Principle, OCP)
>.定义：一个软件实体如类、模块和函数应该对扩展开放，对修改关闭。
1. 对测试的影响降到最低。
2. 提高代码的复用性与维护性。接手维护的人，想要添加新的功能不需要在原有代码的基础上修改了。

###### 对象创建
1. 原型模式：
使用原型实例制定创建对象的种类，并通过复制这个圆形创建新的对象。
```
//我们都知道Swift中的结构体是值传递.也就是说如果我们将某个结构体对象A赋值给对象B.
//如果我们将A里面的属性进行改变,实际上B对象的属性并没有跟着改变.
//这个的本质其实是B对象是另外开辟了一段内存空间.已经完完全全和A分道扬镳了.


struct A {
    let a: Int
    let b: Int
}

let AA = A(a:1,b:2)
let BB = AA
对于struct中Class类型的，一般来说struct不建议包含类对象，因为这造成了struct的歧义，当实际需要时，可根据具体情况判断，需不需要对class 类型拷贝。
//class 类型，可以遵循协议的方式实现
protocol Copyable {
    associatedtype T
    func copy() -> T
}

class Apple: Copyable {
    typealias T = Apple
    func copy() -> Apple {
        return Apple()
    }
}

```
2. 工厂方法：
工厂方法也称虚构造器。定义对象的接口，让子类决定实例化哪一个类。工厂方法似的一个类的实例化延迟到子类。
```
//swift中可以采用两种方式构建对象，遵守协议的对象，或者基类方式

protocol RentalCar {
    var name: String { get }
    var passengers: Int { get }
    var pricePerDay: Float { get }
}
func createRentalCar(passengers: Int) -> RentalCar? {
var car: RentalCar?
switch passengers {
case 0...1:
car = Sports()
case 2...3:
car = Compact()
case 4...8:
car = SUV()
case 9...14:
car = Minivan()
default:
car = nil
}
return car
}

//MARK:使用基类
class RentalCarClass {
    private(set) var name: String
    private(set) var passengers: Int
    private(set) var price: Float
    fileprivate init(name: String, passengers: Int, price: Float) {
        self.name = name
        self.passengers = passengers
        self.price = price
        }

    class func createRentalCar(passengers: Int) -> RentalCar? {
        var car: RentalCar?
        switch passengers {
            case 0...3:
            car = Compact()
            case 4...8:
            car = SUV()
            default:
            car = nil
        }
        return car
    }
}

基于枚举的工厂方法
enum CarType {
    case compact
    case suv
}

enum CurrencyFactory {
    static func currency(for country: CarType) -> RentalCarClass {
    var car: RentalCar?
    switch passengers {
        case compact:
        car = Compact()
        case suv:
        car = SUV()
    return car
    }
}


```


3. 抽象工厂方法：
提供一个创建一系列相关或互相依赖对象的接口，而无需指定它们具体的类。
```
protocol BurgerDescribing {
    var ingredients: [String] { get }
}

struct CheeseBurger: BurgerDescribing {
    let ingredients: [String]
}

protocol BurgerMaking {
    func make() -> BurgerDescribing
}

// Number implementations with factory methods

final class BigKahunaBurger: BurgerMaking {
    func make() -> BurgerDescribing {
        return CheeseBurger(ingredients: ["Cheese", "Burger", "Lettuce", "Tomato"])
    }
}

final class JackInTheBox: BurgerMaking {
    func make() -> BurgerDescribing {
        return CheeseBurger(ingredients: ["Cheese", "Burger", "Tomato", "Onions"])
    }
}
//Abstract factory

enum BurgerFactoryType: BurgerMaking {

    case bigKahuna
    case jackInTheBox

    func make() -> BurgerDescribing {
        switch self {
            case .bigKahuna:
            return BigKahunaBurger().make()
            case .jackInTheBox:
            return JackInTheBox().make()
        }
    }
}
```

4. 生成器
5. 单例
