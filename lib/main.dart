import 'package:desafio_imc/ultil/calculadora.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: const MyHomePage(title: 'IMC'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Future<SharedPreferences> stored = SharedPreferences.getInstance();
  final TextEditingController altura = TextEditingController();
  final TextEditingController peso = TextEditingController();
  double _peso = 0;
  double _altura = 0;

  double resul = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(widget.title),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(children: [
            TextFormField(
              keyboardType: TextInputType.number,
              controller: altura,
              decoration: const InputDecoration(
                  label: Text(
                'Altura',
                style: TextStyle(fontSize: 16),
              )),
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              controller: peso,
              decoration: const InputDecoration(label: Text('Peso')),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: ElevatedButton(
                  onPressed: () {
                    _peso = double.tryParse(peso.text);
                    _altura = double.parse(altura.text);

                    setState(() {
                      resul = (_peso / (_altura * _altura)).roundToDouble();
                    });
                  },
                  child: const Text('Calcular')),
            ),
           resul == null ? Text("") : Container(
              padding: EdgeInsets.all(10),
              child: Text(
                "Seu IMC é :  $resul",
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ),
          ]),
        ),
      ]),
    );
  }
}
