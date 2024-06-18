import 'dart:io';
import 'dart:math';

void main(List<String> arguments) {
  if (arguments.isEmpty) {
    print('Usage: dart main.dart [options]');
    print('-help                    Show this help message');
    print('-fileCount               Provide a count');
    print('-widgetCount             Provide a count');
    print('-codeDir                 Provide a dirPath');
    return;
  }

  // 指定要生成的代码文件数量
  int fileCount = 0;
  // 指定每个文件中的函数数量
  int widgetCount = 0;
  //生成代码目录
  String codeDir = ".";

  // 示例：处理命令行参数
  for (int i = 0; i < arguments.length; i++) {
    switch (arguments[i]) {
      case '--help':
        print('Usage: dart main.dart [options]');
        print('-help                    Show this help message');
        print('-fileCount               Provide a count');
        print('-widgetCount             Provide a count');
        print('-codeDir                 Provide a dirPath');
        break;
      case '-codeDir':
        if (i + 1 < arguments.length) {
          codeDir = arguments[i + 1];
          print('codeDir: ${codeDir}');
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
      case '-widgetCount':
        if (i + 1 < arguments.length) {
          widgetCount = int.parse(arguments[i + 1]);
          print('widgetCount: ${widgetCount}');
          i++;
        } else {
          print('Error: No widgetCount provided');
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
    String className = 'GeneratedWidget${generateRandomString(8)}';

    // 生成随机代码
    String code = generateRandomClass(className, widgetCount);

    // 写入文件
    File file = File('$codeDir/$fileName.dart');
    file.writeAsStringSync(code);

    print('File generated: ${file.path}');
  }
}

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

// 生成随机类
String generateRandomClass(String className, int widgetCount) {
  var random = Random();
  StringBuffer classBuffer = StringBuffer();
  classBuffer.writeln('import \'package:flutter/material.dart\';');
  classBuffer.writeln('');
  classBuffer.writeln('class $className extends StatefulWidget {');
  classBuffer.writeln('  @override');
  classBuffer.writeln('  _${className}State createState() => _${className}State();');
  classBuffer.writeln('}');
  classBuffer.writeln('');
  classBuffer.writeln('class _${className}State extends State<$className> {');
  classBuffer.writeln('  int _selectedIndex = 0;');
  classBuffer.writeln('  final _formKey = GlobalKey<FormState>();');
  classBuffer.writeln('  String _formData = "";');
  classBuffer.writeln('');
  classBuffer.writeln('  void _onItemTapped(int index) {');
  classBuffer.writeln('    setState(() {');
  classBuffer.writeln('      _selectedIndex = index;');
  classBuffer.writeln('    });');
  classBuffer.writeln('  }');
  classBuffer.writeln('');
  classBuffer.writeln('  @override');
  classBuffer.writeln('  Widget build(BuildContext context) {');
  classBuffer.writeln('    return Scaffold(');
  classBuffer.writeln('      appBar: AppBar(title: Text(\'$className\')),');
  classBuffer.writeln('      drawer: Drawer(');
  classBuffer.writeln('        child: ListView(');
  classBuffer.writeln('          padding: EdgeInsets.zero,');
  classBuffer.writeln('          children: <Widget>[');
  classBuffer.writeln('            DrawerHeader(');
  classBuffer.writeln('              decoration: BoxDecoration(');
  classBuffer.writeln('                color: Colors.blue,');
  classBuffer.writeln('              ),');
  classBuffer.writeln('              child: Text(');
  classBuffer.writeln('                \'${generateRandomStringAndNumber(14)}\',');
  classBuffer.writeln('                style: TextStyle(');
  classBuffer.writeln('                  color: Colors.white,');
  classBuffer.writeln('                  fontSize: 24,');
  classBuffer.writeln('                ),');
  classBuffer.writeln('              ),');
  classBuffer.writeln('            ),');
  classBuffer.writeln('            ListTile(');
  classBuffer.writeln('              title: Text(\'${generateRandomStringAndNumber(10)}\'),');
  classBuffer.writeln('              onTap: () {},');
  classBuffer.writeln('            ),');
  classBuffer.writeln('            ListTile(');
  classBuffer.writeln('              title: Text(\'${generateRandomStringAndNumber(8)}\'),');
  classBuffer.writeln('              onTap: () {},');
  classBuffer.writeln('            ),');
  classBuffer.writeln('          ],');
  classBuffer.writeln('        ),');
  classBuffer.writeln('      ),');
  classBuffer.writeln('      body: Center(');
  classBuffer.writeln('        child: IndexedStack(');
  classBuffer.writeln('          index: _selectedIndex,');
  classBuffer.writeln('          children: <Widget>[');

  // 生成指定数量的widget
  for (int i = 0; i < widgetCount; i++) {
    String widgetName = generateRandomString(8);
    classBuffer.writeln(generateRandomWidget(widgetName, random));
  }

  classBuffer.writeln('          ],');
  classBuffer.writeln('        ),');
  classBuffer.writeln('      ),');
  classBuffer.writeln('      bottomNavigationBar: BottomNavigationBar(');
  classBuffer.writeln('        items: const <BottomNavigationBarItem>[');
  classBuffer.writeln('          BottomNavigationBarItem(');
  classBuffer.writeln('            icon: Icon(Icons.home),');
  classBuffer.writeln('            label: \'${generateRandomStringAndNumber(6)}\',');
  classBuffer.writeln('          ),');
  classBuffer.writeln('          BottomNavigationBarItem(');
  classBuffer.writeln('            icon: Icon(Icons.business),');
  classBuffer.writeln('            label: \'${generateRandomStringAndNumber(7)}\',');
  classBuffer.writeln('          ),');
  classBuffer.writeln('          BottomNavigationBarItem(');
  classBuffer.writeln('            icon: Icon(Icons.school),');
  classBuffer.writeln('            label: \'${generateRandomStringAndNumber(8)}\',');
  classBuffer.writeln('          ),');
  classBuffer.writeln('        ],');
  classBuffer.writeln('        currentIndex: _selectedIndex,');
  classBuffer.writeln('        selectedItemColor: Colors.amber[800],');
  classBuffer.writeln('        onTap: _onItemTapped,');
  classBuffer.writeln('      ),');
  classBuffer.writeln('    );');
  classBuffer.writeln('  }');
  classBuffer.writeln('}');

  return classBuffer.toString();
}

// 生成随机widget
String generateRandomWidget(String widgetName, Random random) {
  List<String Function(String, Random)> widgetGenerators = [
    generateRandomText,
    generateRandomButton,
    generateRandomContainer,
    generateRandomImage,
    generateRandomForm,
    generateRandomListView,
    generateRandomGridView
  ];
  String widgetCode = widgetGenerators[random.nextInt(widgetGenerators.length)](widgetName, random);
  return widgetCode;
}

// 生成随机Text widget
String generateRandomText(String widgetName, Random random) {
  String message = generateRandomStringAndNumber(15);
  return '''
            Text('$message'),
  ''';
}

// 生成随机Button widget
String generateRandomButton(String widgetName, Random random) {
  String label = 'Click${generateRandomStringAndNumber(10)}';
  return '''
            ElevatedButton(
              onPressed: () {
                print('$label button pressed');
              },
              child: Text('$label'),
            ),
  ''';
}

// 生成随机Container widget
String generateRandomContainer(String widgetName, Random random) {
  List<String> colors = [
    "Colors.red",
    "Colors.green",
    "Colors.blue",
    "Colors.yellow",
    "Colors.white",
    "Colors.black",
    "Colors.purple",
    "Colors.amber",
    "Colors.blue",
    "Colors.cyan",
    "Colors.deepOrange",
    "Colors.grey",
    "Colors.teal",
    "Colors.lime",
    "Colors.transparent"
  ];
  String color = colors[random.nextInt(colors.length)];
  return '''
            Container(
              width: 100,
              height: 100,
              color: $color,
            ),
  ''';
}

// 生成随机Image widget
String generateRandomImage(String widgetName, Random random) {
  List<String> imageUrls = [
    'https://via.placeholder.com/150',
    'https://via.placeholder.com/200',
    'https://via.placeholder.com/250',
    'https://via.placeholder.com/300'
  ];
  String imageUrl = imageUrls[random.nextInt(imageUrls.length)];
  return '''
            Image.network('$imageUrl'),
  ''';
}

// 生成随机Form widget
String generateRandomForm(String widgetName, Random random) {
  return '''
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(labelText: '${generateRandomStringAndNumber(16)}'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '${generateRandomStringAndNumber(20)}';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _formData = value ?? '';
                    },
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        _formKey.currentState?.save();
                        print('Form data: \$_formData');
                      }
                    },
                    child: Text('Submit${generateRandomStringAndNumber(5)}'),
                  ),
                ],
              ),
            ),
  ''';
}

// 生成随机ListView widget
String generateRandomListView(String widgetName, Random random) {
  return '''
            Expanded(
              child: ListView.builder(
                itemCount: ${random.nextInt(40) + 1},
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Icon(Icons.list),
                    title: Text('List ${generateRandomStringAndNumber(16)} \$index'),
                  );
                },
              ),
            ),
  ''';
}

// 生成随机GridView widget
String generateRandomGridView(String widgetName, Random random) {
  return '''
            Expanded(
              child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4, // 每行显示4个item
                      crossAxisSpacing: 4.0, // 每个item之间的水平间距
                      mainAxisSpacing: 4.0, // 每个item之间的垂直间距
                    ),
                    itemBuilder: (context, index) {
                      return Text('GridView ${generateRandomStringAndNumber(8)} \$index');
                    },
                    itemCount: 20, // GridView中item的数量
                  ),
                ),
         ''';
}
