import 'EntradaCamiones.dart';
import 'SalidaCamiones.dart';

class Agenda {
  DateTime fechaActual;
  List<EntradaCamiones> entradasProgramadas;
  List<SalidaCamiones> salidasProgramadas;

  Agenda({
    required this.fechaActual,
    required this.entradasProgramadas,
    required this.salidasProgramadas,
  });
}


