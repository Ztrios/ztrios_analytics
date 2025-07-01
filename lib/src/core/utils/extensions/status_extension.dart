

import 'package:ztrios_analytics/src/core/utils/enums/enums.dart';

extension StatusX on Status {
  bool get isInitial => this == Status.initial;
  bool get isLoading => this == Status.loading;
  bool get isSuccess => this == Status.success;
  bool get isFailure => this == Status.failure;
  bool get isError => this == Status.error;
}