import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rrhh_clean/app/app_service.dart';

class LogoutWidget extends StatelessWidget {
  LogoutWidget({Key? key}) : super(key: key);

  final appService = Modular.get<AppService>();

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              this.appService.sessionEntity!.email,
              style: TextStyle(fontSize: 13),
            ),
            TextButton(
              child: Text(
                ' Cerrar sesión',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                this.appService.logout(appService.sessionEntity!);
                Modular.to.pushNamedAndRemoveUntil('/login/', (p0) => false);
              },
            ),
          ],
        ),
      ),
    );
  }
}
