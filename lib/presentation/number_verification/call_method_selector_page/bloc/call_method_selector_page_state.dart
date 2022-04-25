import 'package:equatable/equatable.dart';

class CallMethodSelectorPageState extends Equatable {
  CallMethodSelectorPageState({
    required this.smsSelected,
  });

  final bool smsSelected;

  @override
  List<Object?> get props => [smsSelected];
}
