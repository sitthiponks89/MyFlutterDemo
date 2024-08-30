import 'package:flutter/material.dart';
import 'package:my_flutter_demo/model/FoodMenu.dart';
import 'package:my_flutter_demo/utils/Box.dart';
import 'package:my_flutter_demo/model/ExchangeRate.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() async {
  // ignore: unused_local_variable
  var app = const MyApp();
  // ignore: unused_local_variable
  var myImageNetWork = const MyAppNetworkImage();
  // ignore: unused_local_variable
  var myColumnWidget = const MyColumnWidget();
  // ignore: unused_local_variable
  var myWidget = const MyWidget();
  //print(await loginUser());
  runApp(myWidget);
}

//สร้าง widget StatelessWidget คือ ไม่สามารถเปลี่ยนแปลงค่าได้ ใช้สำหรับ widget คงที่ เช่น ข้อความ ไอคอน
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My App",
      home: Scaffold(
        //Scaffold คือ widget หน้าต่างสำเร็จรูปสำหรับจัดการ layout หรือโครงสร้างของหน้าแอพมีการคำนวณระยะห่างของแอพกับหน้าจอ emulator ให้อัตโนมัติ
        appBar: AppBar(
          title: const Text("Hello Flutter"),
        ),
        // ignore: prefer_const_constructors
        body: Center(
          child: const Text(
            "Hi Sitthipon",
            style: TextStyle(fontSize: 30, color: Colors.purple),
          ),
        ),
      ),
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}

//NetworkImage
class MyAppNetworkImage extends StatelessWidget {
  const MyAppNetworkImage({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My App",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Hello Flutter"),
        ),
        // ignore: prefer_const_constructors
        body: Center(
          child: const Image(
              image: NetworkImage(
                  "https://cdn.pixabay.com/photo/2024/08/05/21/19/lion-8947711_1280.jpg")),
        ),
      ),
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}

//Column widget เป็น widget ที่รับเอา widget มาจัดเรียงในแนวตั้งหรือแนวดิ่ง
class MyColumnWidget extends StatelessWidget {
  const MyColumnWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My App",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Hello Flutter"),
        ),
        // ignore: prefer_const_constructors
        body: Center(
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center, //จัด บน,ล่าง,ซ้าย,ขวา
            children: [
              Text("Hello Sitthipon"),
              Text("Hello Dart"),
              Text("Hello Flutter")
            ],
          ),
        ),
      ),
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My App",
      theme: ThemeData(primarySwatch: Colors.blue), // Apply theme
      home: const InitState(),
    );
  }
}

//CountNumber
class CountNumber extends StatefulWidget {
  const CountNumber({super.key});
  @override
  State<CountNumber> createState() => _CountNumberState();
}

class _CountNumberState extends State<CountNumber> {
  int number = 0; //การสร้าง state หรือ ตัวแปร

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("โปรแกรมนับเลข"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, //จัด บน,ล่าง,กลาง
          children: [
            const Text("กดปุ่มเพื่อเพิ่มจำนวนตัวเลข"),
            Text(
              "$number",
              style: const TextStyle(
                fontSize: 60,
                color: Color.fromARGB(255, 233, 45, 45),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addNumber,
        child: const Icon(Icons.add),
      ),
    );
  }

  void addNumber() {
    setState(() {
      number++;
    });
  }
}

//ListView
class MyListView extends StatefulWidget {
  const MyListView({super.key});

  @override
  State<MyListView> createState() => _MyListViewState();
}

class _MyListViewState extends State<MyListView> {
  // Define the getData function
  List<Widget> getData(int number) {
    List<Widget> data = [];
    for (var i = 0; i < number; i++) {
      data.add(Text("Flutter ${i + 1}"));
    }
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("โปรแกรมนับเลข"),
      ),
      body: Center(
        child: ListView(
          children: getData(15),
        ),
      ),
    );
  }
}

//ListTile
class MyListTile extends StatefulWidget {
  const MyListTile({super.key});

  @override
  State<MyListTile> createState() => _MyListTileState();
}

class _MyListTileState extends State<MyListTile> {
  List<Widget> getData(int number) {
    List<Widget> data = [];
    for (var i = 0; i < number; i++) {
      var menu = ListTile(
        title: Text(
          "เมนู ${i + 1}",
          style: const TextStyle(fontSize: 25),
        ),
        subtitle: Text("หัวข้อย่อยที่ ${i + 1}"),
      );
      data.add(menu);
    }
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("เลือกเมนู"),
      ),
      body: Center(
        child: ListView(
          children: getData(20),
        ),
      ),
    );
  }
}

//ListViewBuilder
class MyListViewBuilder extends StatefulWidget {
  const MyListViewBuilder({super.key});

  @override
  State<MyListViewBuilder> createState() => _MyListViewBuilderState();
}

class _MyListViewBuilderState extends State<MyListViewBuilder> {
  List<Foodmenu> menu = [
    Foodmenu("กุ้งเผา", "500", "assets/images/ic_01.jpg"),
    Foodmenu("กระเพราหมู", "80", "assets/images/ic_02.jpg"),
    Foodmenu("ไก่ย่าง", "50", "assets/images/ic_03.jpg"),
    Foodmenu("ผัดไทย", "40", "assets/images/ic_04.jpg")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("เลือกเมนู"),
        ),
        body: ListView.builder(
          itemCount: menu.length,
          itemBuilder: (BuildContext context, int index) {
            Foodmenu food = menu[index];
            return ListTile(
              leading: Image.asset(food.imgFood), //เรียกรูปภาพจากโฟรเดอร์ asset
              title: Text(
                food.name,
                style: const TextStyle(fontSize: 20),
              ),
              subtitle: Text("ราคา ${food.price} บาท"),
              onTap: () {
                print("คุณเลือกเมนูอาหาร = ${food.name}");
              },
            );
          },
        ));
  }
}

//Continer Widget ใช้กำหนดพื้นที่ สามารถกำหนด ขนาดรูปร่าง หรือการจัดวางตำแหน่ง
//Boxdecoration กำหนดรูปร่างของ Continer เช่น สี ลักษณะรูปร่างเป็นต้น
//Padding กำหนดระยะห่างของ Widget ออกจากขอบของ layuot
//Colums Widget ที่ใช้แสดง Widget ย่อย (Child Widget) แนวตั้ง
//Rows Widget ที่ใช้แสดง Widget ย่อย (Child Widget) แนวนอน
//Expandad Widget ที่ใช้ขยายความสูง Widget ย่อย (Child Widget) โดยทำการจัดสรรพื้นที่ของ widget
class MyContinerWidget extends StatefulWidget {
  const MyContinerWidget({super.key});

  @override
  State<MyContinerWidget> createState() => _MyContinerWidgetState();
}

class _MyContinerWidgetState extends State<MyContinerWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("บัญชีของฉัน",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        ),
        body: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                BoxWidget("ยอดคงเหลือ", 10000, Colors.lightBlue, 120),
                SizedBox(
                  height: 5,
                ),
                BoxWidget("รายรับ", 15000, Colors.green, 100),
                SizedBox(
                  height: 5,
                ),
                BoxWidget("รายจ่าย", 5000, Colors.red, 100),
                SizedBox(
                  height: 5,
                ),
                BoxWidget("ค่าชำระเงิน", 1200, Colors.orange, 100)
              ],
            )));
  }
}

//InitState คือ เมธอดที่เรียกให้ทำงานเพียงครั้งเดียว หลังจากที่ State ถูกสร้างขึ้นมาเรียบร้อยแล้ว สามารถเปลี่ยนแปลงข้อมูลของ widget ได้
//Dispose คือ เมธอดที่เรียกใช้เมื่อ widget หายไปจาหน้าแอพหรือให้หยุดทำงานและนำออกจากระบบ
class InitState extends StatefulWidget {
  const InitState({super.key});
  @override
  State<InitState> createState() => _InitStateState();
}

class _InitStateState extends State<InitState> {
  ExchangeRate? dataFromApi; // Nullable to handle null state

  @override
  void initState() {
    super.initState();
    getExchangeRate();
  }

  Future<ExchangeRate?> getExchangeRate() async {
    var url = "https://private-519459-testapi5041.apiary-mock.com/questions";
    try {
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        dataFromApi = exchangeRateFromJson(response.body); //json to dart object
        print("body ${response.body}");
        return dataFromApi;
        // print("body ${response.body}");
        // var data = jsonDecode(response.body);
        // print("data $data");
      } else {
        print("Failed to load data: ${response.statusCode}");
      }
    } catch (e) {
      print("Error: $e");
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "แปลงเปลี่ยนสกุลเงิน",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: FutureBuilder(
        future: getExchangeRate(),
        builder: (BuildContext context, AsyncSnapshot<ExchangeRate?> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              var result = snapshot.data;
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const BoxWidget("สกุลเงิน (USD)", 1, Colors.lightBlue, 80),
                    const SizedBox(height: 5),
                    BoxWidget("EUR", result!.rates["EUR"]!, Colors.green, 80),
                    const SizedBox(height: 5),
                    BoxWidget("THB", result.rates["THB"]!, Colors.red, 80),
                    const SizedBox(height: 5),
                    BoxWidget("JPY", result.rates["JPY"]!, Colors.orange, 80),
                    const SizedBox(height: 5),
                    BoxWidget("KRW", result.rates["KRW"]!, Colors.yellow, 80),
                    const SizedBox(height: 5),
                    BoxWidget("CNY", result.rates["CNY"]!, Colors.pink, 80),
                    const SizedBox(height: 5),
                    BoxWidget("RUB", result.rates["RUB"]!, Colors.purple, 80)
                  ],
                ),
              );
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

//สร้าง widget StatefulWidget คือ สามารถเปลี่ยนแปลงค่าได้ ทำงานได้หลาย state เช่น textfield, checkbox, silder
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePage();
}

class _MyHomePage extends State<MyHomePage> {
  int number = 0; //การสร้าง state หรือ ตัวแปร

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("โปรแกรมนับเลข"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, //จัด บน,ล่าง,กลาง
          children: [
            const Text("กดปุ่มเพื่อเพิ่มจำนวนตัวเลข"),
            Text(
              "$number",
              style: const TextStyle(
                fontSize: 60,
                color: Color.fromARGB(255, 233, 45, 45),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            number++;
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

//ดึงข้อมูล
Future<String> loginUser() async {
  var user = await getUserFromDatabase();
  return "ชื่อผู้ใช้ $user";
}

//เรียกข้อมูล
Future<String> getUserFromDatabase() {
  return Future.delayed(
      const Duration(seconds: 10), () => "Sitthipon"); //delayed 10 seconds
}
