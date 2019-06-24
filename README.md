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
