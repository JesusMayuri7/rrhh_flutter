import 'package:dartz/dartz.dart';
import 'package:rrhh_clean/app/modules/certificados/domain/entities/certificado_entity.dart';
import 'package:rrhh_clean/core/domain/use_cases/usecase.dart';
import 'package:rrhh_clean/core/errors/failure.dart';

class SumListCertificadosUseCase
    implements UseCase<List<CertificadoEntity>, List<CertificadoEntity>> {
  SumListCertificadosUseCase();

  @override
  Future<Either<Failure, List<CertificadoEntity>>> call(
      List<CertificadoEntity> params) async {
    double totalCertificado = 0;
    double totalDevengado = 0;
    double totalSaldo = 0;
    double totalEnero = 0;
    double totalFebrero = 0;
    double totalMarzo = 0;
    double totalAbril = 0;
    double totalMayo = 0;
    double totalJunio = 0;
    double totalJulio = 0;
    double totalAgosto = 0;
    double totalSetiembre = 0;
    double totalOctubre = 0;
    double totalNoviembre = 0;
    double totalDiciembre = 0;

    for (var item in params) {
      totalCertificado += item.monto;
      totalDevengado += item.devengado;
      totalSaldo += item.saldo;
      totalEnero += item.enero;
      totalFebrero += item.febrero;
      totalMarzo += item.marzo;
      totalAbril += item.abril;
      totalMayo += item.mayo;
      totalJunio += item.junio;
      totalJulio += item.julio;
      totalAgosto += item.agosto;
      totalSetiembre += item.setiembre;
      totalOctubre += item.octubre;
      totalNoviembre += item.noviembre;
      totalDiciembre += item.diciembre;
    }
    params.add(CertificadoEntity(
        certificadoId: 0,
        clasificador: '',
        clasificadorId: 0,
        dscCertificado: '',
        idmetaAnual: 0,
        anoEje: 0,
        concepto: '',
        detalle: '',
        finalidad: '',
        fuente: 0,
        fuenteBase: '',
        modalidad: '',
        tipo: '',
        secFunc: '',
        monto: totalCertificado,
        devengado: totalDevengado,
        saldo: totalSaldo,
        enero: totalEnero,
        febrero: totalFebrero,
        marzo: totalMarzo,
        abril: totalAbril,
        mayo: totalMayo,
        junio: totalJunio,
        julio: totalJulio,
        agosto: totalAgosto,
        setiembre: totalSetiembre,
        octubre: totalOctubre,
        noviembre: totalNoviembre,
        diciembre: totalDiciembre));
    return Future.value(Right(params));
  }
}
