import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class AppEvent extends Equatable {}

class AppAnioSelectEvent extends AppEvent {
  final String anioSelected;

  AppAnioSelectEvent(this.anioSelected);

  @override
  List<Object?> get props => [anioSelected];
}
