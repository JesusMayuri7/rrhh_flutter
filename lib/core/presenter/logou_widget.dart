import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rrhh_clean/app/modules/auth/presenter/bloc/auth_bloc.dart';

class LogoutWidget extends StatelessWidget {
  LogoutWidget({Key? key}) : super(key: key);

  final bloc = Modular.get<AuthBloc>();

  @override
  Widget build(BuildContext context) {
    final stateSuccess = (bloc.state as SuccessAuthState);
    return Container(
      alignment: Alignment.topCenter,
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(stateSuccess.loginResponseEntity.email),
            TextButton(
              child: Text(' Cerrar sesión'),
              onPressed: () {
                this.bloc.add(LogoutAuthEvent());
              },
            ),
          ],
        ),
      ),
    );
  }
}
