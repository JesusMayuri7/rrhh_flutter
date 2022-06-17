import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rrhh_clean/app/modules/auth/presenter/bloc/auth_bloc.dart';
import 'package:rrhh_clean/app/modules/liquidacion/bloc/liquidacion_bloc.dart';

import 'liquidacion_detalle/liquidacion_detalle_page.dart';
import 'liquidacion_resumen/liquidacion_resumen_page.dart';
import 'list_liquidacion/liquidacion_grid_page.dart';
import 'report_liquidacion/pages/liquidacion_report_page.dart';

class MainLiquidacionPage extends StatefulWidget {
  final liquidacionBloc = Modular.get<LiquidacionBloc>();

  MainLiquidacionPage() {
    //liquidacionBloc.add(LiquidacionDataLoadedEvent(anio: anioSelected!));
  }

  @override
  MainLiquidacionPageState createState() => MainLiquidacionPageState();
}

class MainLiquidacionPageState extends State<MainLiquidacionPage> {
  final anioSelected = (Modular.get<AuthBloc>().state as SuccessAuthState)
      .loginResponseEntity
      .anio;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ContainedTabBarView(
          tabs: [
            Text('Liquidacion', style: TextStyle(color: Colors.black)),
            Text('Resumen', style: TextStyle(color: Colors.black)),
            Text('Reporte', style: TextStyle(color: Colors.black))
          ],
          tabBarViewProperties: TabBarViewProperties(
            physics: NeverScrollableScrollPhysics(),
          ),
          tabBarProperties: TabBarProperties(
            margin: EdgeInsets.only(top: 1.0),
            width: 250,
            height: 25.0,
            indicatorColor: Colors.black,
            indicatorWeight: 3.0,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey[400],
            position: TabBarPosition.top,
            alignment: TabBarAlignment.start,
          ),
          views: [
            Padding(
              padding: const EdgeInsets.only(right: 5, left: 5, bottom: 5),
              child: BlocBuilder<LiquidacionBloc, LiquidacionState>(
                bloc: widget.liquidacionBloc,
                builder: (context, state) {
                  if (state is LiquidacionLoadedState) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(flex: 9, child: LiquidacionGridPage()),
                              Container(width: 2, color: Colors.blue),
                              Expanded(
                                flex: 3,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  //verticalDirection: VerticalDirection.down,
                                  children: [
                                    Container(
                                        alignment: Alignment.center,
                                        height: 250,
                                        child: LiquidacionDetallePage()
                                        //child: Container(),
                                        ),
                                    //LiquidacionResumenPage()
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    );
                  } else {
                    if (state is LiquidacionLoadingState)
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircularProgressIndicator(),
                            SizedBox(height: 5),
                            Text('Cargando...')
                          ],
                        ),
                      );
                    else
                      return Center(
                        child: TextButton(
                            onPressed: () => widget.liquidacionBloc.add(
                                LiquidacionDataLoadedEvent(anio: anioSelected)),
                            child: Text('Reintentar')),
                      );
                  }
                },
              ),
            ),
            LiquidacionResumenPage(),
            LiquidacionReportPage(),
          ]),
    );
  }
}
