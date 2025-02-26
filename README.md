# CupcakeCorner

## Project 10

Source URL: [Cupcake Corner: Introduction](https://www.hackingwithswift.com/books/ios-swiftui/cupcake-corner-introduction)

"A multi-screen app for ordering cupcakes. This will use a couple of forms, but it also shows how to send and receive the order data from the internet, how to validate forms, and more.

As we continue to dig deeper and deeper into `Codable`, we'll see how flexible and safe it is. In particular, it is very different it is from the much older `UserDefaults` API – it’s so nice not having to worry about typing strings exactly correctly!"

The `main` branch contains Paul Hudson's complete code minus the challenges, which are in their own branches.

### Challenge 1

Our address fields are currently considered valid if they contain anything, even if it’s just only whitespace. Improve the validation to make sure a string of pure whitespace is invalid.

Branch: `challenge-01`

### Challenge 2

If our call to `placeOrder()` fails – for example if there is no internet connection – show an informative alert for the user. To test this, try commenting out the `request.httpMethod = "POST"` line in your code, which should force the request to fail.

Branch: `challenge-02`

![Network Error](/network_error.png)

### Acknowledgments

Original code created by: [Paul Hudson - @twostraws](https://x.com/twostraws) (Thank you!)

Made with :heart: by [@cewitte](https://x.com/cewitte)