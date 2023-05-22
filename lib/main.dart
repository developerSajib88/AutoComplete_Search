import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyWidget(),
    );
  }
}


class MyWidget extends StatefulWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {

  List<String> name = ["Sajib", "Hasan","Talukder","Mohan","Rajib","Rimon"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [

        Padding(
          padding: const EdgeInsets.all(50.0),
          child: Autocomplete(
              onSelected: (value){
                print(value);
              },
              optionsBuilder: (TextEditingValue textEditingValue){
                if(textEditingValue.text.isEmpty){
                  return const Iterable<String>.empty();
                }else{
                  List<String> match = [];
                  match.addAll(name);
                  match.retainWhere((element) => element.toLowerCase().contains(textEditingValue.text.toLowerCase()));
                  return match;
                }
              }
          ),
        )

      ],),
    );
  }
}

