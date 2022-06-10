import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:rrhh_clean/app/bloc/app_bloc.dart';

class SelectionAnioPage extends StatefulWidget {
  SelectionAnioPage({Key? key}) : super(key: key);

  static final DateFormat formatter = DateFormat('yyyy');

  @override
  State<SelectionAnioPage> createState() => _SelectionAnioPageState();
}

class _SelectionAnioPageState extends State<SelectionAnioPage> {
  String _anioSelected = SelectionAnioPage.formatter.format(DateTime.now());

  List<String> _anios = ['2020', '2021', '2022', '2023'];

  final blocApp = Modular.get<AppBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AppBloc, AppState>(
        bloc: this.blocApp,
        listener: (context, state) {
          if (state is AppAnioSelectedState) Modular.to.navigate('/home');
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DropdownButton<String>(
                value: _anioSelected,
                items: _anios.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                      value: value, child: Text(value));
                }).toList(),
                onChanged: (String? value) {
                  print(value);
                  setState(() {
                    _anioSelected = value!;
                  });
                  // this.blocApp.add(AppAnioSelectEvent(_anioSelected));
                },
              ),
              ElevatedButton(
                onPressed: () {
                  this.blocApp.add(AppAnioSelectEvent(_anioSelected));
                },
                child: const Text('Aceptar!'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget dropDownAnio() {
    return SizedBox(
      width: 93,
      height: 20,
      child: Padding(
        padding: const EdgeInsets.only(left: 5, right: 11),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Flexible(
                child: Text(
              _anioSelected,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 11),
            )),
            const SizedBox(
              width: 12,
              height: 17,
              child: FittedBox(
                fit: BoxFit.fill,
                child: Icon(
                  Icons.arrow_drop_down,
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
