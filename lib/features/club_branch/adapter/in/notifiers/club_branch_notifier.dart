import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ldv_app/features/club_branch/domain/models/club_branch.dart';

class ClubBranchNotifier extends Notifier<ClubBranch?> {
  ClubBranchNotifier();

  @override
  ClubBranch? build() {
    return null;
  }

  void setBranch({required ClubBranch branch}) {
    state = branch;
  }

  void reset() {
    state = null;
  }
}
