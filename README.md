# FileManager
FileManager class to manage big files.

## What is it?
It is a little algorithm to serialize lua objects to string and strings to lua objects. It is pretty fast when you have premade data maps (premade objects) instead of dynamic objects (not premade ones).

## How to use it?
You need to create a FileManager instance and to do so you use the method `FileManager.new`; which receives a single argument which is the structure of the file.<br />
The structure of the file is the description of an object type. FileManager can handle different object types, which are `dictionary`, `array`, `boolean`, `string` and `number`.<br />
There can be premade and dynamic dictionaries, arrays and strings. A premade object means that part of the data of the object will be stored in the structure and not in the file, saving file space and runtime. For example, in a premade dictionary you tell it which objects it will handle,
### dictionary objects
These are tables which have any index if it is a premade dictionary, or string indexes if it is a dynamic one.<br />
They can have an `objects` argument which will make it a dynamic dictionary and the argument will contain the description of another object, or they can have a `map` argument which will make it a premade dictionary and will accept many objects in the argument. Each one of those objects in the premade dictionary must have a `name` argument which will be the name of the object inside the dictionary.
### array objects
These are tables with ordered numeric indexes.<br />
They can have an `objects` argument which will make it a dynamic array and the argument will contain the description of another object, or they can have a `map` argument which will make it a premade array and will accept many objects in the argument.
### boolean objects
These are simple booleans. They don't accept any argument.
### string objects
These are strings. They accept an optional `length` argument which will define the exact length of the string.
### number objects
These are numbers. They can be positive or negative and an integer or a float. They don't accept any argument.

## Didn't you understand the tutorial?
You can read [example.lua](example.lua) to get an example!

## Can it be used for player data?
Of course it can be used for player data! It is not really recommended because it is not that good for data versioning (if you add/remove a field, you need to update player data to make it compatible) since you need to flag it yourself at the beginning of the string, create migration functions and different managers per each version. I recommend [DataHandler](https://atelier801.com/topic?f=6&t=874652) (sadly the topic is in BR only) to handle player data.