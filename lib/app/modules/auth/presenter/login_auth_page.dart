import 'package:fluent_ui/fluent_ui.dart' as fluentUi hide Colors;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:rrhh_clean/app/modules/auth/domain/login_auth_usecase.dart';
import 'package:rrhh_clean/core/uitls/widgets/show_toast_dialog.dart';
import 'package:rrhh_clean/core/uitls/widgets/windows_buttons.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:rrhh_clean/core/uitls/widgets/label_with_form_field.dart';
import 'package:window_manager/window_manager.dart';

import 'bloc/auth_bloc.dart';

class AuthPage extends StatefulWidget {
  AuthPage({Key? key}) : super(key: key);

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> with WindowListener {
  List<String> _anios = ['2020', '2021', '2022', '2023'];
  static final DateFormat formatter = DateFormat('yyyy');
  String _anioSelected = formatter.format(DateTime.now());

  final bloc = Modular.get<AuthBloc>();
  final share = Modular.getAsync<SharedPreferences>();

  //final SharedPreferences share = Modular.get<SharedPreferences>();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    windowManager.removeListener(this);
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    windowManager.addListener(this);
  }

  @override
  void onWindowClose() async {
    await windowManager.destroy();
  }

  @override
  Widget build(BuildContext context) {
    AuthCoreParams params = AuthCoreParams(anio: _anioSelected);
    return BlocListener<AuthBloc, AuthState>(
        bloc: this.bloc,
        listener: (context, state) async {
          if (state is ErrorAuthState) {
            showToastError(context, state.message);
          }
          if (state is SuccessAuthState) {
            if (state.loginResponseEntity.isLogged) {
              final SharedPreferences preferences =
                  Modular.get<SharedPreferences>();
              preferences.clear();
              preferences.setString('token', state.loginResponseEntity.token);
              preferences.setString('anio', state.loginResponseEntity.anio);
              preferences.setString(
                  'message', state.loginResponseEntity.message);
              preferences.setBool('status', state.loginResponseEntity.status);
              preferences.setBool('isLogged', true);
              preferences.setInt(
                  'expiresIn', state.loginResponseEntity.expiresIn);
              preferences.setString('email', state.loginResponseEntity.email);
             // share.then((pref) {
                Modular.to.navigate('/start/agenda/');
           // }
            //  );
            }
          }
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: fluentUi.MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 27,
                  child: Row(
                    crossAxisAlignment: fluentUi.CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          child:
                              Container() /* const DragToMoveArea(
                          child: Align(
                            alignment: AlignmentDirectional.centerStart,
                            child: Padding(
                              padding: EdgeInsets.only(left: 5),
                              child: Text('Recursos Humanos '),
                            ),
                          ),
                        ), */
                          ),
                      if (!kIsWeb) const WindowButtons(),
                    ],
                  ),
                ),
                Form(
                  key: _formKey,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 200.0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            _logo(),
                            Container(
                              width: 200,
                              child: LabelWithFormField(
                                  maxLength: 100,
                                  textAlign: TextAlign.start,
                                  title: 'Email',
                                  onSaved: (value) {
                                    params.email = value!;
                                  },
                                  keyboardType: TextInputType.emailAddress),
                            ),
                            Container(
                              width: 200,
                              child: LabelWithFormField(
                                  maxLength: 100,
                                  textAlign: TextAlign.start,
                                  title: 'Password',
                                  onSaved: (value) {
                                    params.password = value!;
                                  },
                                  keyboardType: TextInputType.visiblePassword),
                            ),
                            DropdownButton<String>(
                              value: _anioSelected,
                              items: _anios.map<DropdownMenuItem<String>>(
                                  (String value) {
                                return DropdownMenuItem<String>(
                                    value: value, child: Text(value));
                              }).toList(),
                              onChanged: (String? value) {
                                setState(() {
                                  _anioSelected = value!;
                                  params.anio = _anioSelected;
                                });
                                // this.blocApp.add(AppAnioSelectEvent(_anioSelected));
                              },
                            ),
                            fluentUi.FilledButton(
                                onPressed: () {
                                  // if (_formKey.currentState!.validate()) {
                                  _formKey.currentState!.save();
                                  this.bloc.add(LoginAuthEvent(params: params));
                                  //}
                                },
                                child: Text('Login'))
                          ]),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  Widget _logo() {
    return Container(
      child: Column(
        children: <Widget>[
          Icon(
            Icons.supervised_user_circle,
            size: 200.0,
            color: Color.fromRGBO(0, 0, 255, 1.0),
          ),
          Text(
            "Login",
            style: TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
        ],
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
