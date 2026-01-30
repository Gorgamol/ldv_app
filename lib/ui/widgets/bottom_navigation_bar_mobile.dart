import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ldv_app/core/utils/build_context_extensions.dart';
import 'package:ldv_app/features/branch/adapter/in/branch_cubit.dart';
import 'package:ldv_app/features/branch/domain/models/branch.dart';
import 'package:ldv_app/features/shared/models/side_bar_item.dart';

class BottomNavigationBarMobile extends StatelessWidget {
  const BottomNavigationBarMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final branch = context.select((BranchCubit cubit) => cubit.state);
    final currentRoute = GoRouter.of(context).state.path ?? '';

    final bottomBarItems = switch (branch) {
      Branch.park => _getParkItems(
        context: context,
        currentRoute: currentRoute,
      ),
      Branch.mill => _getMillItems(
        context: context,
        currentRoute: currentRoute,
      ),
      Branch.theater => _getTheaterItems(
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
                    padding: EdgeInsets.all(
                      context.ldvUiConstants.mobileSpacing,
                    ),
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
          SizedBox(height: context.ldvUiConstants.mobileSpacing),
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
          context.replace('/tasks');
        },
        title: context.translate.tasks,
      ),
      SideBarItem(
        icon: const Icon(Icons.book_outlined),
        active: currentRoute == '/maintenance',
        onTap: () {
          context.replace('/maintenance');
        },
        title: context.translate.maintenance,
      ),
      SideBarItem(
        icon: const Icon(Icons.calendar_month),
        active: currentRoute == '/weddings',
        onTap: () {
          context.replace('/weddings');
        },
        title: 'Kalender',
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
          context.replace('/tasks');
        },
        title: context.translate.tasks,
      ),
      SideBarItem(
        icon: const Icon(Icons.book_outlined),
        active: currentRoute == '/maintenance',
        onTap: () {
          context.replace('/maintenance');
        },
        title: context.translate.maintenance,
      ),
      SideBarItem(
        icon: const Icon(Icons.calendar_month),
        active: currentRoute == '/weddings',
        onTap: () {
          context.replace('/weddings');
        },
        title: 'Kalender',
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
          context.replace('/tasks');
        },
        title: context.translate.tasks,
      ),
      SideBarItem(
        icon: const Icon(Icons.calendar_month),
        active: currentRoute == '/weddings',
        onTap: () {
          context.replace('/weddings');
        },
        title: 'Kalender',
      ),
    ];
  }
}
