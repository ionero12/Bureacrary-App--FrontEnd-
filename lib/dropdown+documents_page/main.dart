import './models/document.dart';
import './task_service.dart';
import './documents_service.dart';
import 'package:flutter/material.dart';
import './buttomNavigationBar.dart';
import 'package:adaptive_navbar/adaptive_navbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'My App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? _selectedOption;
  final TasksService _tasksService = TasksService();
  late List<String> _options =[];

  @override
  void initState() {
    super.initState();
    _loadTasksNames();
  }

  Future<void> _loadTasksNames() async {
    final tasksNames = await _tasksService.getTasksNames();
    setState(() {
      _options = tasksNames;
    });
  }

  @override
  Widget build(BuildContext context) {
    final sw = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AdaptiveNavBar(
        screenWidth: sw,
        backgroundColor: const Color(0xFF101C2B),
        leading: Image.asset(
          'images/logo-ip.png',
          width: 50,
          height: 50,
        ),
        navBarItems: [
          NavBarItem(
            text: "Home",
            onTap: () {
              Navigator.pushNamed(context, "routeName");
            },
          ),
          NavBarItem(
            text: "Institution",
            onTap: () {
              Navigator.pushNamed(context, "routeName");
            },
          ),
          NavBarItem(
            text: "Contact",
            onTap: () {
              Navigator.pushNamed(context, "routeName");
            },
          ),
          NavBarItem(
            text: "My account",
            onTap: () {
              Navigator.pushNamed(context, "routeName");
            },
          ),
        ],
      ),
      body: Center(
          child: Container(
        color: const Color(0xff293441),
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: const Color(0xff293441),
            ),
            width: 850, // setați lățimea dorită
            //height: 400, // setați înălțimea dorită
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DropdownButtonFormField(
                  dropdownColor: const Color(0xff896F4E),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                    filled: true,
                    fillColor: const Color(0xff896F4E),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                      borderSide: BorderSide.none,
                    ),
                    hintStyle: const TextStyle(color: Colors.white),
                    hintText: 'Selecteaza document',
                    hintMaxLines: 3,
                  ),
                  value: _selectedOption,
                  onChanged: (newValue) {
                    setState(() {
                      _selectedOption = newValue.toString();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              MyOtherPage(selectedOption: _selectedOption!),
                        ),
                      );
                    });
                  },
                  items: _options.map((option) {
                    return DropdownMenuItem(
                      value: option,
                      child: Text(
                        option,
                        style: const TextStyle(color: Colors.white),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ),
      )),
      bottomNavigationBar: const ButtomNavigationBar(),
    );
  }
}

class MyOtherPage extends StatefulWidget {
  final String selectedOption;
  //const MyOtherPage({Key? key}) : super(key: key);
  const MyOtherPage({Key? key, required this.selectedOption}) : super(key: key);

  @override
  _MyOtherPageState createState() => _MyOtherPageState();
}

class _MyOtherPageState extends State<MyOtherPage> {
  final DocumentApi _documentApi = DocumentApi();
  late List<Document>? _documents =[];

  @override
  void initState() {
    super.initState();
    _loadDocuments();
  }

  Future<void> _loadDocuments() async {
    final documents = await _documentApi.getDocuments(widget.selectedOption);
    setState(() {
      _documents = documents;
    });
  }

  @override
  Widget build(BuildContext context) {
    final sw = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xff293441),
      appBar: AdaptiveNavBar(
        screenWidth: sw,
        backgroundColor: const Color(0xFF101C2B),
        leading: Image.asset(
          'images/logo-ip.png',
          width: 50,
          height: 50,
        ),
        navBarItems: [
          NavBarItem(
            text: "Home",
            onTap: () {
              Navigator.pushNamed(context, "routeName");
            },
          ),
          NavBarItem(
            text: "Institution",
            onTap: () {
              Navigator.pushNamed(context, "routeName");
            },
          ),
          NavBarItem(
            text: "Contact",
            onTap: () {
              Navigator.pushNamed(context, "routeName");
            },
          ),
          NavBarItem(
            text: "My account",
            onTap: () {
              Navigator.pushNamed(context, "routeName");
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(16.0),
              child: Text(
                'Acte necesare pentru eliberare ${widget.selectedOption}',
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontFamily: "Inria Serif",
                    fontSize: 30,
                    color: Colors.white),
              ),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: const Color.fromARGB(255, 137, 111, 78),
                ),
                //height: 700,
                //width: 600,
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(
                        _documents?.length ?? 0,
                        (index) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0), //+
                           //EdgeInsets.only(left: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${index + 1}. ${_documents?[index].name} ',
                                style: const TextStyle(
                                  fontFamily: 'Inria Serif',
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                                maxLines: 3,
                              ),
                              Text(
                                'Price: ${_documents?[index].price}',
                                style: const TextStyle(
                                  fontFamily: 'Inria Serif',
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Image.asset('images/schema.png'),
                  ],
                ),
              ),
              Image.asset('images/orase.png'),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const ButtomNavigationBar(),
    );
  }
}
