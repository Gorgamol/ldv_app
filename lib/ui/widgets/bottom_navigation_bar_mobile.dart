import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ldv_app/core/utils/build_context_extensions.dart';
import 'package:ldv_app/features/club_branch/domain/models/club_branch.dart';
import 'package:ldv_app/features/club_branch/providers.dart';
import 'package:ldv_app/features/shared/models/side_bar_item.dart';

class BottomNavigationBarMobile extends ConsumerWidget {
  const BottomNavigationBarMobile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final branch = ref.watch(clubBranchProvider);

    final currentRoute = GoRouter.of(
      context,
    ).routerDelegate.currentConfiguration.uri.toString();

    final bottomBarItems = switch (branch) {
      ClubBranch.park => _getParkItems(
        context: context,
        currentRoute: currentRoute,
      ),
      ClubBranch.mill => _getMillItems(
        context: context,
        currentRoute: currentRoute,
      ),
      ClubBranch.theater => _getTheaterItems(
        context: context,
        currentRoute: currentRoute,
      ),
      _ => <SideBarItem>[],
    };

    return ColoredBox(
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Divider(
            thickness: 1.5,
            height: 1.5,
            color: context.ldvColors.black,
            radius: context.ldvUiConstants.roundedBorderRadius,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              for (final item in bottomBarItems) ...[
                InkWell(
                  onTap: item.onTap,
                  borderRadius: context.ldvUiConstants.roundedBorderRadius,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Container(
                          width: 40,
                          height: 26,
                          decoration: BoxDecoration(
                            color: item.active
                                ? context.ldvColors.bitterSweet
                                : Colors.transparent,
                            borderRadius:
                                context.ldvUiConstants.roundedBorderRadius,
                          ),
                          child: item.icon,
                        ),
                        Text(
                          item.title ?? '',
                          style: TextStyle(
                            fontWeight: item.active
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ],
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  // TODO(pak): Dont define sidebar items here. Also rename class, since this is not a sidebar.
  List<SideBarItem> _getParkItems({
    required BuildContext context,
    required String currentRoute,
  }) {
    return [
      SideBarItem(
        icon: const Icon(Icons.list_alt_outlined),
        active: currentRoute == '/tasks',
        onTap: () {
          context.go('/tasks');
        },
        title: context.translate.tasks,
      ),
      SideBarItem(
        icon: const Icon(Icons.book_outlined),
        active: currentRoute == '/maintenance',
        onTap: () {
          context.go('/maintenance');
        },
        title: context.translate.maintenance,
      ),
      SideBarItem(
        icon: const Icon(Icons.festival_outlined),
        active: currentRoute == '/weddings',
        onTap: () {
          context.go('/weddings');
        },
        title: context.translate.weddings,
      ),
    ];
  }

  List<SideBarItem> _getMillItems({
    required BuildContext context,
    required String currentRoute,
  }) {
    return [
      SideBarItem(
        icon: const Icon(Icons.list_alt_outlined),
        active: currentRoute == '/tasks',
        onTap: () {
          context.go('/tasks');
        },
        title: context.translate.tasks,
      ),
      SideBarItem(
        icon: const Icon(Icons.book_outlined),
        active: currentRoute == '/maintenance',
        onTap: () {
          context.go('/maintenance');
        },
        title: context.translate.maintenance,
      ),
    ];
  }

  List<SideBarItem> _getTheaterItems({
    required BuildContext context,
    required String currentRoute,
  }) {
    return [
      SideBarItem(
        icon: const Icon(Icons.list_alt_outlined),
        active: currentRoute == '/tasks',
        onTap: () {
          context.go('/tasks');
        },
        title: context.translate.tasks,
      ),
    ];
  }
}
