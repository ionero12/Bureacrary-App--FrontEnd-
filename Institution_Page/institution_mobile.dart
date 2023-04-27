import 'package:flutter/material.dart';

class InstitutionMobile extends StatelessWidget {
  const InstitutionMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(50),
      child: Column(
        children: <Widget>[
          Column(
            children: [
              Column(
                children: [
                  Image.asset(
                    'images/primaria.png',
                    width: 200,
                    height: 200,
                  ),
                ],
              ),
              Column(
                children: [
                  const Text(
                    "Primaria Municipiului Iasi",
                    style: TextStyle(fontSize: 20),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 50),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: const Color(
                              0xff896F4E), // aici setezi culoarea butonului
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
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
          Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.only(top: 150),
                  ),
                  Column(
                    children: <Widget>[
                      Row(children: [
                        Column(
                          children: [
                            Row(
                              children: const [
                                Padding(
                                  padding: EdgeInsets.only(bottom: 25),
                                ),
                                Text(
                                  "Contact:",
                                  style: TextStyle(fontSize: 20),
                                ),
                              ],
                            ),
                            Row(
                              children: const [
                                Padding(
                                  padding: EdgeInsets.only(top: 25),
                                ),
                                Icon(
                                  Icons.phone,
                                  color: Colors.black,
                                  size: 16,
                                ),
                                Text(
                                  'Email: grupaA3@gmail.com',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: const [
                                Padding(
                                  padding: EdgeInsets.only(top: 25),
                                ),
                                Icon(
                                  Icons.fax,
                                  color: Colors.black,
                                  size: 16,
                                ),
                                Text(
                                  'Email: grupaA3@gmail.com',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: const [
                                Padding(
                                  padding: EdgeInsets.only(top: 25),
                                ),
                                Icon(
                                  Icons.web,
                                  color: Colors.black,
                                  size: 16,
                                ),
                                Text(
                                  'Email: grupaA3@gmail.com',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: const [
                                Padding(
                                  padding: EdgeInsets.only(top: 25),
                                ),
                                Icon(
                                  Icons.email,
                                  color: Colors.black,
                                  size: 16,
                                ),
                                Text(
                                  'Email: grupaA3@gmail.com',
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
                      Row(children: [
                        Column(
                          children: [
                            Row(
                              children: const [
                                Padding(
                                  padding: EdgeInsets.only(bottom: 25),
                                ),
                                Text(
                                  "Program:",
                                  style: TextStyle(fontSize: 20),
                                ),
                              ],
                            ),
                            Row(
                              children: const [
                                Padding(
                                  padding: EdgeInsets.only(top: 25),
                                ),
                                Icon(
                                  Icons.email,
                                  color: Colors.black,
                                  size: 16,
                                ),
                                Text(
                                  'Email: grupaA3@gmail.com',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: const [
                                Padding(
                                  padding: EdgeInsets.only(top: 25),
                                ),
                                Icon(
                                  Icons.email,
                                  color: Colors.black,
                                  size: 16,
                                ),
                                Text(
                                  'Email: grupaA3@gmail.com',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: const [
                                Padding(
                                  padding: EdgeInsets.only(top: 25),
                                ),
                                Icon(
                                  Icons.email,
                                  color: Colors.black,
                                  size: 16,
                                ),
                                Text(
                                  'Email: grupaA3@gmail.com',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: const [
                                Padding(
                                  padding: EdgeInsets.only(top: 25),
                                ),
                                Icon(
                                  Icons.email,
                                  color: Colors.black,
                                  size: 16,
                                ),
                                Text(
                                  'Email: grupaA3@gmail.com',
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
                      Row(children: [
                        Column(
                          children: [
                            Row(
                              children: const [
                                Padding(
                                  padding: EdgeInsets.only(bottom: 25),
                                ),
                                Text(
                                  "Adresa:",
                                  style: TextStyle(fontSize: 20),
                                ),
                              ],
                            ),
                            Row(
                              children: const [
                                Padding(
                                  padding: EdgeInsets.only(top: 25),
                                ),
                                Icon(
                                  Icons.location_city_rounded,
                                  color: Colors.black,
                                  size: 16,
                                ),
                                Text(
                                  'Email: grupaA3@gmail.com',
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
        ],
      ),
    );
  }
}