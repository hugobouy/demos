/**
 * Topics to demonstrate:
 * 
 * - Static typing
 * - Type inference (compiler guesses types)
 * - Type casting (type conversion)
 * - Type test operators
 * - Null safety
 * - Generics
 */

void main() {
  //simpleTypes();
  //nullableTypes();
  complexTypes();
}

/*****************************************************************************/

void simpleTypes() {
  // try declaring the following with `var` and initializing them with `null`
  var inum = 42; // int
  var fpnum = 3.14; // double
  var snum = '442'; // String, var is best practice

  //
  var null_var = null;
  print('null_var.runtimeType = ${null_var.runtimeType}');

  print('inum.runtimeType = ${inum.runtimeType}');
  print('fpnum.runtimeType = ${fpnum.runtimeType}');
  print('snum.runtimeType = ${snum.runtimeType}');

  // inum = fpnum;
  // fpnum = inum;

  inum = fpnum.toInt();
  fpnum = inum.toDouble();
  // fpnum = inum as double; // Type cast --> fails, double is not a subtype of int

  inum = int.parse(snum);
  snum = inum.toString();
}

/*****************************************************************************/

void nullableTypes() {
  int? n = null; // try initializing with `null`

  print('n.runtimeType = ${n.runtimeType}');

  print(n == null);

  if (n != null) {
    print(n.abs());
    print(n + 10);
  }
  print(n?.abs()); // null-aware operator

  print(n??0 + 10); // if n is null, use 0
}

/*****************************************************************************/

void complexTypes() {
  var inum = 42;
  var fpnum = 3.14;
  var snum = '442';

  var listOfAll = [inum, fpnum, snum];

  List<Object> listOfObjs = [inum, fpnum, snum];

  var listOfNums = [inum, fpnum, -5, 0.01];

  var listOfStrs = [snum, 'mobile', 'app', 'dev'];

  var listOfUnknown = [];

  var listOfStrs2 = <String>[];

  List<String> listOfStrs3 = [];

  print('listOfAll.runtimeType = ${listOfAll.runtimeType}');
  print('listOfObjs.runtimeType = ${listOfObjs.runtimeType}');
  print('listOfNums.runtimeType = ${listOfNums.runtimeType}');
  print('listOfStrs.runtimeType = ${listOfStrs.runtimeType}');
  print('listOfUnknown.runtimeType = ${listOfUnknown.runtimeType}');
  print('listOfStrs2.runtimeType = ${listOfStrs2.runtimeType}');
  print('listOfStrs3.runtimeType = ${listOfStrs3.runtimeType}');

  print(listOfObjs[0] is int);
  // print(listOfObjs[0] + 10); // error
  print((listOfObjs[0] as int) + 10); // type cast

  print(listOfObjs[2] is String);
  // print(listOfObjs[2].length);

  print(listOfStrs[0].length);
}
