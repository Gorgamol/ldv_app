import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:ldv_app/core/l10n/l10n.dart';
import 'package:ldv_app/features/branch/domain/models/branch.dart';
import 'package:ldv_app/features/maintenance/adapter/in/maintenance_overview_state.dart';
import 'package:ldv_app/features/maintenance/domain/use_cases/load_maintentance_items_use_case.dart';

@injectable
class MaintenanceOverviewCubit extends Cubit<MaintenanceOverviewState> {
  MaintenanceOverviewCubit(this._loadMaintentanceItemsUseCase)
    : super(const MaintenanceOverviewState());

  final LoadMaintentanceItemsUseCase _loadMaintentanceItemsUseCase;

  Future<void> loadMaintenanceItems({required Branch branch}) async {
    emit(state.copyWith(status: .loading));

    try {
      final items = await _loadMaintentanceItemsUseCase(branch: branch);

      emit(state.copyWith(status: .success, items: items));
    } catch (exception) {
      emit(state.copyWith(status: .failure, error: L10n.translate.error));
    }
  }
}
