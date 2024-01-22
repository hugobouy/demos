/**
 * Topics to demonstrate:
 * 
 * - Basic functions
 * - Parameter options (optional, named, default)
 * - Anonymous functions 
 * - Higher-order functions
 * - Lexical scope (closures)
 */
import 'dart:convert';
import 'dart:io';
import 'dart:math';

void main() {
  parameterOptions();
  anonymousFunctions();
  hofs();
  lexicalScoping();
}

/*****************************************************************************/

void parameterOptions() {
  printCharacterSheet('Bob');
  printCharacterSheet('Tom', 50);
  printCharacterSheet('Alice', 1000, 'Fireball');
  printCharacterSheet2(name: 'Bob');
  printCharacterSheet2(name: 'Tom', hp: 50);
  printCharacterSheet2(name: 'Alice', ability: 'Fireball', hp: 1000);
}

// parameters between [] are optional, and have a default value
 void printCharacterSheet(String name, [int hp=100, String? ability]) {
  print('Name: $name');
  print('HP: $hp');
  if (ability != null) {
    print('Ability: $ability');
  }
}

// parameters between {} are named, and have a default value.
// named parameters are optional, and can be passed in any order
// to make a named parameter required, add `required` before the type
// note: required parameters must come before optional parameters
void printCharacterSheet2({
  required String name,
  int hp=100,
  String? ability,
}) {
  print('Name: $name');
  print('HP: $hp');
  if (ability != null) {
    print('Ability: $ability');
  }
}

/*****************************************************************************/

int foo(int x) {
  return x * 2;
}


void anonymousFunctions() {
  int Function(int) fn1 = foo;
  var fn2 = foo;

  print('fn1 is ${fn1.runtimeType}');
  print('fn2 is ${fn2.runtimeType}');
  print('fn1(5) = ${fn1(5)}');
  print('fn2(5) = ${fn2(5)}');

  var fn3 = (int x) => x * 2;

  var fn4 = (int x) {
    x *= 2;
    return x;
  };

  var fn5 = ({required int x}) => x * 2;

  print('fn3(5) = ${fn3(5)}');
  print('fn4(5) = ${fn4(5)}');
  print('fn5(x: 5) = ${fn5(x: 5)}');
}

/*****************************************************************************/

// generic function that uses generic types E and T
// It takes a list of type T, and a function that takes a T and returns an E
List<E> map<E,T>(List<T> list, E Function(T) f) {
  // note: `E Function(T) f` is the same as `E f(T)`
  final result = <E>[];
  for (final item in list) {
    result.add(f(item));
  }
  return result;
}


List<E> filter<E>(List<E> list, bool Function(E) pred) {
  // note: `bool Function(E) pred` is the same as `bool pred(E)`
  final result = <E>[];
  for (final item in list) {
    if (pred(item)) {
      result.add(item);
    }
  }
  return result;
}

void hofs() {
  const list = ['dart', 'is', 'a', 'semi-cool', 'language'];


  final pairs = map(list, (s) => (s.length, s));
  print(pairs);


  final filtered = filter(pairs, (pair) => pair.$1 > 5);
  print(filtered);

  // actually map and filter are built-in methods on lists

  list.map((s) => (s.length, s))
      .where((pair) => pair.$1 > 5)
      .forEach((element) => print(element));


  var grades = <String, List<double>> {
    'Alice': [90, 100, 95],
    'Bob': [90, 80, 85],
    'Carol': [70, 75, 80],
    'David': [60, 70, 65],
  };


  grades.forEach((name, scores) {
    final maxScore = scores.reduce(max);
    print('$name: $maxScore');
  });


  HttpClient()
      .getUrl(Uri.parse('https://moss.cs.iit.edu/cs442'))
      .then((request) => request.close())
      .then((response) => response.transform(Utf8Decoder()))
      .then((utf8) => utf8.transform(LineSplitter()))
      .then((lines) => lines.take(10).forEach((line) => print(line)));
}

/*****************************************************************************/

Function makeAdder() {
  int x = Random().nextInt(100);
  print('Made adder with x = $x');
  return (int y) => x + y;
}


void lexicalScoping() {
  final adder = makeAdder();
  print(adder(10));
  print(adder(20));
  print(adder(30));
}
