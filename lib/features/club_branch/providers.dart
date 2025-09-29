import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ldv_app/features/club_branch/adapter/in/notifiers/club_branch_notifier.dart';
import 'package:ldv_app/features/club_branch/domain/models/club_branch.dart';

final clubBranchProvider = NotifierProvider<ClubBranchNotifier, ClubBranch?>(
  () => ClubBranchNotifier(),
);
