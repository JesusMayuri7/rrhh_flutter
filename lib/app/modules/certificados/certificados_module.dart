import 'package:flutter_modular/flutter_modular.dart';

import 'data/repositories/certificados_repository_impl.dart';

import 'domain/usecases/agregar_certificado/get_modalidad_concepto_clasificador_use_case.dart';
import 'domain/usecases/agregar_certificado/save_certificado_use_case.dart';
import 'domain/usecases/agregar_certificado/validar_certificado_cas_use_case.dart';
import 'domain/usecases/list_certificado/get_list_certificados.dart';
import 'domain/usecases/list_certificado/sum_list_certificados_usecase.dart';

import 'external/get_list_certificados_impl.dart';
import 'external/modalidad_concepto_clasificador_impl.dart';
import 'external/save_certificado_impl.dart';
import 'external/validar_certificado_impl.dart';

import 'presenter/pages/agregar_certificado/bloc/certificados_bloc.dart';
import 'presenter/pages/list_certificados/bloc/list_certificado_bloc.dart';
import 'presenter/pages/main_certificado_page.dart';

class CertificadosModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => CertificadosBloc(
          i(),
          i(),
          i(),
        )),
    Bind((i) => ListCertificadoBloc(i(), i())),
    Bind((i) => ValidarCertificadoUseCase(i())),
    Bind((i) => SumListCertificadosUseCase()),
    Bind((i) => SaveCertificadoUseCase(i())),
    Bind((i) => GetListCertificadosUseCase(i())),
    Bind((i) => GetModalidadConceptoClasificadorUseCase(i())),
    Bind((i) => CertificadosRepositoryImpl(i(), i(), i(), i())),
    Bind((i) => ModalidadConceptoDatasourceImpl(httpCustom: i())),
    Bind((i) => ValidarCertificadoImpl(httpCustom: i())),
    Bind((i) => GetListCertificadoImpl(httpCustom: i())),
    Bind((i) => SaveCertificadoDatasourceImpl(httpCustom: i()))
    //Bind((i) => BaseCasDataSource(basecasList: [])),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => MainCertificadoPage()),
  ];
}
