import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:ldv_app/features/branch/domain/models/branch.dart';

@lazySingleton
class BranchCubit extends Cubit<Branch?> {
  BranchCubit() : super(null);

  void setBranch({required Branch branch}) {
    emit(branch);
  }
}
