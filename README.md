# CupcakeCorner

## Project 10

A multi-screen app for ordering cupcakes. This will use a couple of forms, but it also shows how to send and receive the order data from the internet, how to validate forms, and more.

As we continue to dig deeper and deeper into `Codable`, we'll see how flexible and safe it is. In particular, it is very different it is from the much older `UserDefaults` API – it’s so nice not having to worry about typing strings exactly correctly!

Source URL: [Cupcake Corner: Introduction](https://www.hackingwithswift.com/books/ios-swiftui/cupcake-corner-introduction)

### 1. Sending and receiving Codable data with URLSession and SwiftUI ([Page link](https://www.hackingwithswift.com/books/ios-swiftui/sending-and-receiving-codable-data-with-urlsession-and-swiftui))

Branch: `urlsession-sending-receiving-data`

iOS gives us built-in tools for sending and receiving data from the internet, and if we combine it with Codable support then it’s possible to convert Swift objects to JSON for sending, then receive back JSON to be converted back to Swift objects. Even better, when the request completes we can immediately assign its data to properties in SwiftUI views, causing our user interface to update.

To demonstrate this we can load some example music JSON data from Apple’s iTunes API, and show it all in a SwiftUI List. Apple’s data includes lots of information, but we’re going to whittle it down to just two types: a Result will store a track ID, its name, and the album it belongs to, and a Response will store an array of results.

### 2. Loading an image from a remote server ([Page Link](https://www.hackingwithswift.com/books/ios-swiftui/loading-an-image-from-a-remote-server))

Branch: `loading-remote-image`

SwiftUI’s Image view works great with images in your app bundle, but if you want to load a remote image from the internet you need to use AsyncImage instead. These are created using an image URL rather than a simple asset name or Xcode-generated constant, but SwiftUI takes care of all the rest for us – it downloads the image, caches the download, and displays it automatically.

### 3. Validating and disabling forms ([Page Link](https://www.hackingwithswift.com/books/ios-swiftui/validating-and-disabling-forms))

Branch: `validating-disabling-forms`

SwiftUI’s `Form` view lets us store user input in a really fast and convenient way, but sometimes it’s important to go a step further – to check that input to make sure it’s valid before we proceed.

Well, we have a modifier just for that purpose: `disabled()`. This takes a condition to check, and if the condition is true then whatever it’s attached to won’t respond to user input – buttons can’t be tapped, sliders can’t be dragged, and so on. You can use simple properties here, but any condition will do: reading a computed property, calling a method, and so on.

### Acknowledgements

Thank you [Paul Hudson - @twostraws](https://x.com/twostraws)

Made with ❤️ by @cewitte
