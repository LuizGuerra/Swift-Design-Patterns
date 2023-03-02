# Delegate

The Delegate is a way to implement communication between objects in which one object (the delegate) handles certain events or behaviours on behalf of another object.

### Why?

By using this pattern, the main object can delegate some of its responsibilities to the delegate, allowing for better organization and separation of concerns.

In Swift, this pattern is usually used to avoid memory leaks, help with lower coupling, and to help define responsibilities more clearly.

### How?

For example, you have Object A. It creates an Object B to perform a task for him. At the end of the task, we need to update Object A with the result, of course, we could make Object B manually update Object A, but updating Object A isn't the clear responsibility of Object B.

His responsibility is only to perform said task! Because of this, to make things clear and clean, the Delegate Pattern is used here to do this new task, helping with modularity and lowering the coupling between classes.

#### Please give me another example

For this example, you have Object A. Let’s call it GameScreen. The GameScreen shows the player items, how many coins he has and more. Then, the player decided to buy some coins, so, the GameScreen creates an Object B to perform a task for him. Let’s call it BuyCoinsScreen.

![Relationship between our two classes](https://miro.medium.com/v2/resize:fit:1400/format:webp/1*Sp3jqQAIrHXS76y8xVJryQ.png)

Now, when the user finishes buying some coins on BuyCoinsScreen, we need to go back and update the GameScreen with our new coins! But how do we do it?

We need to create first the Delegate itself (which in Swift is usually a protocol) and implement it in our GameScreen. Let's first determine our GameScreen:

``` Swift
class GameScreen {
    var totalCoins: Int
    func userWantsToBuyCoins() {
        let vc = GameScreen()
        present(vc, animated: true)
    }
}
```

Now, let's create our delegate that will be responsible for this new responsibility and implement it:

``` Swift
protocol EntityDelegate: AnyObject {
    func updateCoins(with newValue: Int)
}
extension GameScreen: EntityDelegate {
    func updateCoins(with newValue: Int) {
        totalCoins += newValue
    }
}
```

Don't forget to make the protocol conform to AnyObject! Without that, we will get an error!

Now, we should add to our BuyCoinsScreen the delegate reference and make it use it:

``` Swift
class BuyCoinsScreen {
    weak var delegate: EntityDelegate?
    func userBoughtCoins(_ total: Int) {
        delegate?.updateCoins(with: total)
    }
}
```

Let's not forget from making the delegate reference weak, since we are after all referencing something from the father class.

Very nice! But something is missing here. We have our new Delegate, the GameScreen, its extension and our BuyCoinsScreen, but we are not passing the delegate reference to our BuyCoinsScreen! If we don't do that, our delegate will never be called.

![](https://miro.medium.com/v2/resize:fit:1400/format:webp/1*CekvzSoEQb7kvDN_-_hlNg.png)

So, let's do that! In the GameScreen function, where we present the BuyCoinsScreen, we need to say that the delegate is the GameScreen itself.


``` Swift
func userWantsToBuyCoins() {
    //...
    vc.delegate = self
    //...
}
```

Well, isn't that a bit weird? How could we be the delegate? Wasn't that the protocol? Well, yes, but remember that our GameScreen now conforms to the protocol itself, this way we can make the behaviour directly decoupled from our classes, making it easier not only to have clearer responsibilities but now any other class in our project can use the Delegate we wrote!

![](https://miro.medium.com/v2/resize:fit:1400/format:webp/1*4tLpyfDjuA1TrnRwO6jiEw.png)

### Medium article

If you want to read more details about it, go [here](https://luizpedrofg.medium.com/delegate-pattern-f709d5f413e6). The explaination is the same, but I also wrote some observations about this design pattern at the end of the article. You can find it with the <b>Some Observations</b> title. There, I go into detail about the naming convention, memory management and reusability, and when not to use it ("It's not a tool for all cases").
