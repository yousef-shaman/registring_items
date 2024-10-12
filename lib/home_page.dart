import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //************************************ Variable *****************************************************************
  int index = 3;
  int counter = 2;
  String counterLable = "Grades";
  final List<String> _items = [];
  final TextEditingController itemTitle = TextEditingController();
  GlobalKey<FormState> formstate = GlobalKey();

  //************************************ Method *****************************************************************
  void _addItem() {
    if (itemTitle.text.isNotEmpty) {
      setState(() {
        _items.add(itemTitle.text);
        itemTitle.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //===================================================================== Appbar Widger ====================================================================================
        appBar: AppBar(
          title: const Text("Registring Items"),
          backgroundColor: Colors.blueAccent,
          toolbarHeight: 80,
          titleTextStyle:
              const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
        ),
        //===================================================================== ListView Widger ====================================================================================
        body: ListView(
          padding: const EdgeInsets.all(10),
          children: [
            //===================================================================== Part 1 of the page ====================================================================================
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue, width: 5)),
              padding: const EdgeInsets.all(20),
            
              
              //************************************ Form Widget "==Used for dealing with TextFormField==" *****************************************************************
              child: Form(
                key: formstate,
                //--------------------------------------------------------------------------- Column ---------------------------------------------------------------
                child: Column(
                  children: [
                    //************************************ TextFormField *****************************************************************
                    TextFormField(
                      controller: itemTitle,
                      validator: (value) {
                            
                        if(value!.isEmpty){
                          print("object");
                          return "The field is empty";
                          
                        }if(value.length > 6){
                          return "Just 6 characters allowd";
                        }
                        
                      },
                      decoration:
                          const InputDecoration(border: OutlineInputBorder(borderSide: BorderSide(width: 20, color: Colors.brown)),),
                      
                    ),
                    //++++++++++++++++++ Divider using SizeBox
                    const SizedBox(
                      height: 15,
                    ),
                    //++++++++++++++++++ Divider using SizeBox
                            
                    //************************************ ElevatedButton *****************************************************************
                    ElevatedButton(
                        style: const ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(Colors.amber),
                            padding: WidgetStatePropertyAll(EdgeInsets.all(20)),
                            fixedSize:
                                WidgetStatePropertyAll(Size.fromWidth(500))),
                        onPressed: () {
                          if(formstate.currentState!.validate()){
                            _addItem();
                          }
                        },
                        child: const Text(
                          "Add item",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        )),
                  ],
                ),
              ),
              //--------------------------------------------------------------------------- END of Column ---------------------------------------------------------------
            ),

            //===================================================================== Part 2 of the page ====================================================================================
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.lightBlue, width: 6)),
              margin: const EdgeInsets.fromLTRB(10, 30, 10, 0),
              //--------------------------------------------------------------------------- Row ---------------------------------------------------------------
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () {
                        setState(() {
                          counterLable = "Grades";
                          counter < 3 ? counter++ : counterLable = "maxmum is";
                          print(
                              "======================================================  $counter");
                        });
                      },
                      icon: const Icon(Icons.add)),
                  Text(
                    "$counterLable $counter",
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          counterLable = "Grades";
                          counter > 1 ? counter-- : counterLable = "minmum is";
                          print(
                              "======================================================  $counter");
                        });
                      },
                      icon: const Icon(Icons.remove)),
                ],
              ),
              //--------------------------------------------------------------------------- END of Row ---------------------------------------------------------------
            ),
            const SizedBox(
              height: 30,
            ),
            //===================================================================== Part 3 of the page ====================================================================================
            Container(
              height: 500,
              color: Colors.blue,
              //************************************ GridView.builder *****************************************************************
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: counter),
                itemCount: _items.length,
                itemBuilder: (context, index) {
                  //++++++++++++++++++ Card is the widget that's being repeat
                  return Card(
                    margin: const EdgeInsets.all(20),
                    child: Center(
                      child: Text(_items[index], style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),),
                    ),
                  );
                },
              ),
            ),
          ],
        ));
  }
}
