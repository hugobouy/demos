/**
 * Topics to demonstrate:
 * 
 * - Classes
 * - Constructors
 * - Getters & Setters
 * - Inheritance
 * - Mixins
 * - Operator overloading
 * - Object identity, equality, and constant objects
 */

import 'dart:math';


// Classes
class Shape {
  double area() {
    return 0; // can we get rid of this definition?
  }
}


// Inheritance
class Circle extends Shape {
  double radius; // By default, all attributes and methods are public, but can be made private with an underscore. Example: _radius

  // Constructor
  Circle(this.radius); // The constructor is expecting one parameter that is assigned to the radius attributes

  // Getters and Setters
  double get diameter => radius * 2; // Getters and setters are used like an attributes. Example: print(circle.diameter);
  set diameter(double value) => radius = value / 2;

  double area() {
    return 3.14159 * radius * radius;
  }

  // Operator overloading
  Circle operator +(Circle other) {
    return Circle(this.radius + other.radius);
  }
}

class Rectangle extends Shape {
  double width;
  double height;

  // Constructors
  Rectangle(this.width, this.height);

  double area() {
    return width * height;
  }
}

class Square extends Rectangle {
  // Constructor with initializer list
  Square(double side) : super(side, side);
}


// Mixin
mixin Positioned {
  double x = 0;
  double y = 0;

  double distanceTo(Positioned other) {
    final dx = x - other.x;
    final dy = y - other.y;
    return sqrt(dx * dx + dy * dy);
  }
}

class PositionedCircle extends Circle with Positioned {
  PositionedCircle(double radius, double x, double y)
      : super(radius) {
    this.x = x;
    this.y = y;
  }
}

class Blob with Positioned {
  final String name;

  Blob(this.name, double x, double y) {
    this.x = x;
    this.y = y;
  }
}


// Object identity, equality, and constant objects
class Foo {
  final int x;
  final int y;
  
  const Foo(this.x, this.y); // try making this const
  // all final variables must have been initialized before the constructor body is executed
  // solution is use "late". Example: late int x;
  // a late variable is still fianal, but it can be initialized later

  bool operator ==(Object other) {
    if (other is Foo) {
      return x == other.x && y == other.y;
    }
    return false;
  }

  int get hashCode => x.hashCode ^ y.hashCode;
}


void main() {
  var circle = Circle(5);
  print('Circle Area: ${circle.area()}');
  print('Circle Diameter: ${circle.diameter}');
  print('Is Circle a Shape? ${circle is Shape}');


  circle.diameter = 50;
  print('Updated Circle Radius: ${circle.radius}');


  var circle2 = circle + Circle(8);
  print('Circle2 Radius: ${circle2.radius}');
  print('Circle2 Area: ${circle2.area()}');


  var rectangle = Rectangle(4, 6);
  print('Rectangle Area: ${rectangle.area()}');


  var square = Square(5);
  print('Is Square a Shape? ${square is Shape}');
  print('Is Square a Rectangle? ${square is Rectangle}');
  print('Square Area: ${square.area()}');


  var pCircle = PositionedCircle(8, 2, 5);

  print('Positioned Circle Area: ${pCircle.area()}');
  print('Positioned Circle Position: (${pCircle.x}, ${pCircle.y})');
  print('Is Positioned Circle a Circle? ${pCircle is Circle}');
  print('Is Positioned Circle Positioned? ${pCircle is Positioned}');


  var blob = Blob('Flubber', 5, 1);
  print('Is Blob a Shape? ${blob is Shape}');
  print('Is Blob Positioned? ${blob is Positioned}');
  print('Distance between Circle and Blob: ${pCircle.distanceTo(blob)}');


  // how to make the following const objects? what does it mean?
  var foo1 = Foo(5, 10);
  var foo2 = Foo(5, 10);
  // if adding a const constructor, then the following is true:
  // print('foo1 == foo2? ${foo1 == foo2}');
  // The two objects are referring to the same object in memory
  // if object are const, then the constructor can't have a body

  print('foo1 == foo2? ${foo1 == foo2}');
  print('foo1.hashCode == foo2.hashCode? ${foo1.hashCode == foo2.hashCode}');
  print('foo1 identity == foo2 identity? ${identical(foo1, foo2)}');
}
