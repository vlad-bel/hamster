import 'package:equatable/equatable.dart';

class CallMethodSelectorPageState extends Equatable {
  const CallMethodSelectorPageState({
    required this.smsSelected,
  });

  final bool smsSelected;

  @override
  List<Object?> get props => [smsSelected];
}
