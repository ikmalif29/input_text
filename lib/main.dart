import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: "Input Text, Alert & SnackBar",
      home: Home(),
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
    ),
  );
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String teks = "";

  TextEditingController controller = TextEditingController();
  TextEditingController controllerSnackbar = TextEditingController();

  void _snackbar(BuildContext context, String str) {
    if (str.isEmpty) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          str,
          style: TextStyle(fontSize: 16.0, color: Colors.white),
        ),
        backgroundColor: Colors.amber,
        duration: Duration(seconds: 5),
      ),
    );
  }

  void _alertdialog(String str) {
    if (str.isEmpty) return;

    AlertDialog alertDialog = AlertDialog(
      content: Text(
        str,
        style: TextStyle(fontSize: 18.0, color: Colors.blueAccent),
      ),
      actions: <Widget>[
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.amber,
          ),
          child: Text("Exit"),
          onPressed: () {
            Navigator.pop(context);
          },
        )
      ],
    );

    showDialog(context: context, builder: (context) => alertDialog);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Input Text, Alert & SnackBar"),
        backgroundColor: Colors.amber,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Tulis dan Tampilkan Teks:",
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            TextField(
              decoration: InputDecoration(
                hintText: "Ketik teks di sini...",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onChanged: (String str) {
                setState(() {
                  teks = str;
                });
              },
            ),
            SizedBox(height: 8.0),
            Text(
              teks,
              style: TextStyle(fontSize: 20.0, color: Colors.black87),
            ),
            Divider(),
            Text(
              "Tulis Teks untuk Alert Dialog:",
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: "Ketik teks untuk alert...",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onSubmitted: (String str) {
                _alertdialog(str);
                controller.clear();
              },
            ),
            Divider(),
            Text(
              "Tulis Teks untuk SnackBar:",
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            TextField(
              controller: controllerSnackbar,
              decoration: InputDecoration(
                hintText: "Ketik teks untuk snackbar...",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onSubmitted: (String str) {
                _snackbar(context, str);
                controllerSnackbar.clear();
              },
            ),
          ],
        ),
      ),
    );
  }
}
