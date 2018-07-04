# MicrowaveNumbers
Figuring out how long to cook your food based on weird mathematical preferences

This can help you find amounts of time to put into the microwave, such that you can say a statement of the form "This LOOKS like a number that's special in X way, but the total number of seconds is actually a different number that's also special in X way".

For example, if you cook your food for 1 minute and 21 seconds, then 1:21 it will look like 121 which is a square number, but the total number of seconds is 1 * 60 + 21 = 81, which is another square.

# Instructions
You must first install Haskell on your system. The ghci interpreter is sufficient to use MicrowaveNumbers.

In Haskell, import the Microwave module, then try "microwave squares" and you'll get [121, 2025]
which means [1 minute 21 seconds, 20 minutes 25 seconds], but you probably don't want to cook your food for 20:25.
Time lengths that are even larger (over an hour) may exist but have been filtered out in the "microwave" function.

The microwave function can take any increasing list of integers as an argument, even an infinite one.
So you can try Fibonacci numbers or whatever.

The CoolSquares module is just an older version, which was specific to square numbers only.
