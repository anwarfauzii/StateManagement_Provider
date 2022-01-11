import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../providers/user_provider.dart';
import '../providers/weigh_provider.dart';
import 'login_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final TextEditingController _ctrlWeight = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double maxValue = 100;
    double minValue = 10;

    WeighProvider weighProvider = Provider.of<WeighProvider>(context);
    UserProvider userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contoh AppBar'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Berat Badan : ${weighProvider.weight.round()} Kg',
                style: const TextStyle(fontSize: 30)),
            const SizedBox(height: 15),
            Slider(
              value: weighProvider.weight.toDouble(),
              min: minValue,
              max: maxValue,
              onChanged: (value) {
                weighProvider.changeWeight(value.round());
              },
            ),
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: TextFormField(
                        controller: _ctrlWeight,
                        cursorColor: Colors.black,
                        maxLength: 2,

                        keyboardType: TextInputType.number,
                        // inputFormatters:<TextInputFormatter> [FilteringTextInputFormatter.digitsOnly],
                        decoration: const InputDecoration(
                          labelText: 'Berat Badan Anda',
                          counterText: '',
                          border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 3, color: Colors.indigo)),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextButton(
                        onPressed: () {
                          if (_ctrlWeight.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Kotak Tidak Boleh Kosong'),
                              ),
                            );
                          } else {
                            int total = weighProvider.weight +
                                int.parse(_ctrlWeight.text);
                            if (total > 100) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                      'Total Berat Badan Melebihi Batas Maksimal'),
                                ),
                              );
                            } else {
                              weighProvider.changeWeightbyInput(
                                  int.parse(_ctrlWeight.text));
                            }
                          }
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.indigo,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(8),
                          child: Text(
                            'Tambah',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ))
                  ],
                ),
                Column(
                  children: [
                    TextButton(
                      onPressed: () {
                        if (weighProvider.weight == maxValue) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Nilai Maksimal telah dicapai'),
                            ),
                          );
                        } else {
                          print(weighProvider.weight);
                          weighProvider.changeWeightbyButton('add');
                        }
                      },
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.lightBlue,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                      child: const Icon(Icons.add, color: Colors.white),
                    ),
                    TextButton(
                      onPressed: () {
                        if (weighProvider.weight == minValue) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text('Nilai Minimal telah dicapai')));
                        } else {
                          print(weighProvider.weight);
                          weighProvider.changeWeightbyButton('min');
                        }
                      },
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.lightBlue,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                      child: const Icon(Icons.remove, color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 30),
            TextButton(
              onPressed: () {
                userProvider.removeToken();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.indigo,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    'Logout',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
