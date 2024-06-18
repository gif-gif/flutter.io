import 'dart:io';
import 'dart:math';

void main(List<String> arguments) {
  // 指定要生成的代码文件数量
  int fileCount = 0;
  // 指定每个文件中的函数数量
  int functionCount = 0;

  String codeDir = ".";

  if (arguments.isEmpty) {
    print('Usage: dart main.dart [options]');
    print('-help                    Show this help message');
    print('-fileCount               Provide a count');
    print('-functionCount           Provide a count');
    print('-codeDir                 Provide a dirPath');
    return;
  }

  // 指定要生成的代码文件数量
  // 指定每个文件中的函数数量
  //生成代码目录

  // 示例：处理命令行参数
  for (int i = 0; i < arguments.length; i++) {
    switch (arguments[i]) {
      case '--help':
        print('Usage: dart main.dart [options]');
        print('-help                    Show this help message');
        print('-fileCount               Provide a count');
        print('-functionCount           Provide a count');
        print('-codeDir                 Provide a dirPath');
        break;
      case '-codeDir':
        if (i + 1 < arguments.length) {
          codeDir = arguments[i + 1];
          print('codesPath: ${codeDir}');
          i++;
        } else {
          print('Error: No codeDir provided');
        }
        break;
      case '-fileCount':
        if (i + 1 < arguments.length) {
          fileCount = int.parse(arguments[i + 1]);
          print('fileCount: ${fileCount}');
          i++;
        } else {
          print('Error: No fileCount provided');
        }
        break;
      case '-functionCount':
        if (i + 1 < arguments.length) {
          functionCount = int.parse(arguments[i + 1]);
          print('widgetCount: ${functionCount}');
          i++;
        } else {
          print('Error: No functionCount provided');
        }
        break;
      default:
        print('Unknown argument: ${arguments[i]}');
    }
  }

  // 生成指定数量的代码文件
  for (int i = 0; i < fileCount; i++) {
    // 生成随机文件名和类名
    String fileName = generateRandomString(8);
    String className = 'GeneratedClass${generateRandomString(8)}';

    // 生成随机代码
    String code = generateRandomClass(className, functionCount);

    // 写入文件
    File file = File('$codeDir/$fileName.dart');
    file.writeAsStringSync(code);

    print('File generated: ${file.path}');
  }
}

// 生成随机类
String generateRandomClass(String className, int functionCount) {
  var random = Random();
  StringBuffer classBuffer = StringBuffer();
  classBuffer.writeln('class $className {');

  // 生成指定数量的函数
  for (int i = 0; i < functionCount; i++) {
    String functionName = generateRandomString(8);
    classBuffer.writeln(generateRandomFunction(functionName, random));
  }

  classBuffer.writeln('}');

  return classBuffer.toString();
}

// 生成随机函数
String generateRandomFunction(String functionName, Random random) {
  List<String Function(String, Random)> functionGenerators = [
    generateAdditionFunction,
    generateSubtractionFunction,
    generateMultiplicationFunction,
    generateDivisionFunction,
    generateSquareFunction,
    generateRandomStringFunction,
    generateFactorialFunction
  ];
  String functionCode = functionGenerators[random.nextInt(functionGenerators.length)](functionName, random);
  return functionCode;
}

// 生成加法函数
String generateAdditionFunction(String functionName, Random random) {
  String varA = generateRandomString(5);
  String varB = generateRandomString(5);
  int a = random.nextInt(100);
  int b = random.nextInt(100);
  return '''
  int $functionName() {
    int $varA = $a;
    int $varB = $b;
    int result = $varA + $varB;
    print('Result of $functionName: \$result');
    return result;
  }
  ''';
}

// 生成减法函数
String generateSubtractionFunction(String functionName, Random random) {
  String varA = generateRandomString(5);
  String varB = generateRandomString(5);
  int a = random.nextInt(100);
  int b = random.nextInt(100);
  return '''
  int $functionName() {
    int $varA = $a;
    int $varB = $b;
    int result = $varA - $varB;
    print('Result of $functionName: \$result');
    return result;
  }
  ''';
}

// 生成乘法函数
String generateMultiplicationFunction(String functionName, Random random) {
  String varA = generateRandomString(5);
  String varB = generateRandomString(5);
  int a = random.nextInt(100);
  int b = random.nextInt(100);
  return '''
  int $functionName() {
    int $varA = $a;
    int $varB = $b;
    int result = $varA * $varB;
    print('Result of $functionName: \$result');
    return result;
  }
  ''';
}

// 生成除法函数
String generateDivisionFunction(String functionName, Random random) {
  String varA = generateRandomString(5);
  String varB = generateRandomString(5);
  int a = random.nextInt(100) + 1; // 避免除以0
  int b = random.nextInt(99) + 1; // 避免除以0
  return '''
  double $functionName() {
    int $varA = $a;
    int $varB = $b;
    double result = $varA / $varB;
    print('Result of $functionName: \$result');
    return result;
  }
  ''';
}

// 生成计算平方的函数
String generateSquareFunction(String functionName, Random random) {
  String varA = generateRandomString(5);
  int a = random.nextInt(100);
  return '''
  int $functionName() {
    int $varA = $a;
    int result = $varA * $varA;
    print('Result of $functionName: \$result');
    return result;
  }
  ''';
}

// 生成随机字符串函数
String generateRandomStringFunction(String functionName, Random random) {
  int length = random.nextInt(10) + 5;
  return '''
  String $functionName() {
    String randomString = generateRandomString($length);
    print('Random string: \$randomString');
    return randomString;
  }

  String generateRandomStringAndNumber(int length) {
    const characters = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    Random random = Random();
    return String.fromCharCodes(Iterable.generate(
        length, (_) => characters.codeUnitAt(random.nextInt(characters.length))));
  }
  ''';
}

// 生成计算阶乘的函数
String generateFactorialFunction(String functionName, Random random) {
  String varA = generateRandomString(5);
  int a = random.nextInt(10) + 1; // 阶乘数值不宜过大
  return '''
  int $functionName() {
    int $varA = $a;
    int result = 1;
    for (int i = 1; i <= $varA; i++) {
      result *= i;
    }
    print('Factorial of $functionName: \$result');
    return result;
  }
  ''';
}

// 生成随机字符串
String generateRandomString(int length) {
  const characters = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
  Random random = Random();
  return String.fromCharCodes(
      Iterable.generate(length, (_) => characters.codeUnitAt(random.nextInt(characters.length))));
}

// 生成随机字符串
String generateRandomStringAndNumber(int length) {
  const characters = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890';
  Random random = Random();
  return generateRandomString(3) +
      String.fromCharCodes(Iterable.generate(length, (_) => characters.codeUnitAt(random.nextInt(characters.length))));
}
