import 'package:flutter/material.dart';
import 'institution.dart';
import 'institution_service.dart';

class InstitutionDesktop extends StatefulWidget {
  @override
  _InstitutionDesktopState createState() => _InstitutionDesktopState();
}

class _InstitutionDesktopState extends State<InstitutionDesktop> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  InstitutionService _institutionService = InstitutionService();
  Institution? _institution;

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 200,
          color: const Color(0xff293441), // culoarea containerului
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                width: 500,
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                decoration: BoxDecoration(
                  color: const Color(0xff293441), // culoarea băii de căutare
                  border: Border.all(
                    width: 2,
                    color: const Color(0xff896F4E),
                  ),
                  borderRadius: BorderRadius.circular(24.0),
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      TextFormField(
                        controller: _nameController,
                        decoration: const InputDecoration(
                          labelText: 'Institution Name',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter an institution name';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16.0),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff896F4E),
                        ),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            try {
                              final institution = await _institutionService
                                  .getInstitutionByName(_nameController.text);
                              setState(() {
                                _institution = institution;
                              });
                            } catch (e) {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text('Error'),
                                    content: const Text(
                                        'Failed to load institution'),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.of(context).pop(),
                                        child: const Text('OK'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            }
                          }
                        },
                        child: const Text('Find Institution'),
                      ),
                      //const SizedBox(height: 16.0),
                                      
                    ],
                      ),
                  ),
              ),
                      if (_institution != null) ...[
                        Container(
                          height: 500,
                          padding: const EdgeInsets.only(top:100),
                          decoration: BoxDecoration(border: Border.all(color: Colors.black26)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              child: Row(
                                children: <Widget>[
                                  Column(
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            'images/primaria.png',
                                            width: 300,
                                            height: 300,
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            "${_institution!.name}",
                                            style: TextStyle(fontSize: 20),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              const Padding(
                                                padding:
                                                    EdgeInsets.only(top: 50),
                                              ),
                                              ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  primary: const Color(
                                                      0xff896F4E), // aici setezi culoarea butonului
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16), // aici setezi forma butonului
                                                  ),
                                                ),
                                                onPressed: () {
                                                  // aici poți adăuga acțiunea pe care vrei să o facă butonul când este apăsat
                                                },
                                                child: const Text(
                                                  'Vezi Feedback', // aici poți seta textul butonului
                                                  style: TextStyle(
                                                    color: Colors
                                                        .black, // aici setezi culoarea textului butonului
                                                    fontSize:
                                                        16, // aici setezi mărimea textului butonului
                                                  ),
                                                ),
                                              )
                                            ],
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ), //inchis container
                            Expanded(
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      const Padding(
                                        padding: EdgeInsets.only(top: 50),
                                      ),
                                      Column(
                                        children: <Widget>[
                                          Row(
                                            children: const [
                                              Text(
                                                "Contact:",
                                                style: TextStyle(fontSize: 30),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: <Widget>[
                                          Row(children: [
                                            const Padding(
                                              padding:
                                                  EdgeInsets.only(left: 50),
                                            ),
                                            Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 25),
                                                    ),
                                                    Icon(
                                                      Icons.phone,
                                                      color: Colors.black,
                                                      size: 16,
                                                    ),
                                                    Text(
                                                      'Phone Number: ${_institution!.phoneNumber}',
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 25),
                                                    ),
                                                    Icon(
                                                      Icons.fax,
                                                      color: Colors.black,
                                                      size: 16,
                                                    ),
                                                    Text(
                                                      'Website: ${_institution!.website}',
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ]),
                                        ],
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      const Padding(
                                        padding: EdgeInsets.only(top: 150),
                                      ),
                                      Column(
                                        children: <Widget>[
                                          Row(
                                            children: const [
                                              Text(
                                                "Program:",
                                                style: TextStyle(fontSize: 30),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: <Widget>[
                                          Row(children: [
                                            const Padding(
                                              padding:
                                                  EdgeInsets.only(left: 50),
                                            ),
                                            Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 25),
                                                    ),
                                                    Text(
                                                      'Monday: ${_institution!.monday}',
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 25),
                                                    ),
                                                    Text(
                                                      'Tuesday: ${_institution!.tuesday}',
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 25),
                                                    ),
                                                    Text(
                                                      'Wednesday: ${_institution!.wednesday}',
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 25),
                                                    ),
                                                    Text(
                                                      'Thursday: ${_institution!.thursday}',
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 25),
                                                    ),
                                                    Text(
                                                      'Friday: ${_institution!.friday}',
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ]),
                                        ],
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Column(
                                        children: <Widget>[
                                          Row(
                                            children: const [
                                              Text(
                                                "Adresa:",
                                                style: TextStyle(fontSize: 30),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: <Widget>[
                                          Row(children: [
                                            const Padding(
                                              padding:
                                                  EdgeInsets.only(left: 50),
                                            ),
                                            Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 25),
                                                    ),
                                                    Icon(
                                                      Icons
                                                          .location_city_rounded,
                                                      color: Colors.black,
                                                      size: 16,
                                                    ),
                                                    Text(
                                                      'Adresa: ${_institution!.address}',
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ]),
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        ),
                    ],
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Flexible(
                      flex: 1,
                      child: Image.asset(
                        'images/orase.png', // prima imagine
                        fit: BoxFit.cover,
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Image.asset(
                        'images/orase.png', // a doua imagine
                        fit: BoxFit.cover,
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Image.asset(
                        'images/orase.png', // a treia imagine
                        fit: BoxFit.cover,
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Image.asset(
                        'images/orase.png', // a treia imagine
                        fit: BoxFit.cover,
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Image.asset(
                        'images/orase.png', // a treia imagine
                        fit: BoxFit.cover,
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Image.asset(
                        'images/orase.png', // a treia imagine
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ],
    );
  }
}
