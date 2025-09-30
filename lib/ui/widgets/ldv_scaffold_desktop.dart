import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ldv_app/core/utils/build_context_extensions.dart';
import 'package:ldv_app/features/club_branch/domain/models/club_branch.dart';
import 'package:ldv_app/features/club_branch/providers.dart';
import 'package:ldv_app/features/shared/models/side_bar_item.dart';
import 'package:ldv_app/ui/widgets/ldv_rounded_button.dart';

class LdvScaffoldDesktop extends StatelessWidget {
  const LdvScaffoldDesktop({
    super.key,
    required this.title,
    required this.content,
    this.actions,
  });

  final String title;
  final Widget content;
  final Widget? actions;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.ldvColors.grey,
      body: Padding(
        padding: const EdgeInsets.only(top: 16, right: 16, bottom: 16),
        child: Row(
          spacing: 16,
          children: [
            const _SideBar(),
            Expanded(
              child: _Content(title: title, content: content, actions: actions),
            ),
          ],
        ),
      ),
    );
  }
}

class _SideBar extends ConsumerWidget {
  const _SideBar();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final branch = ref.watch(clubBranchProvider);

    final currentRoute = GoRouter.of(
      context,
    ).routerDelegate.currentConfiguration.uri.toString();

    final sideBarItems = switch (branch) {
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

    return Column(
      spacing: 16,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: switch (branch) {
            ClubBranch.park => Image.asset(
              'assets/images/logo_park.png',
              height: 60,
            ),
            ClubBranch.mill => Image.asset(
              'assets/images/logo_mill.png',
              height: 60,
            ),
            ClubBranch.theater => Image.asset(
              'assets/images/logo_theater.png',
              height: 60,
            ),
            _ => const SizedBox.shrink(),
          },
        ),
        for (final item in sideBarItems) ...[
          Row(
            children: [
              Container(
                height: 54,
                width: 6,
                decoration: BoxDecoration(
                  color: item.active
                      ? context.ldvColors.bitterSweet
                      : Colors.transparent,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              LdvRoundedButton(
                height: 64,
                width: 64,
                onTap: item.onTap,
                child: item.icon,
              ),
            ],
          ),
        ],
      ],
    );
  }

  List<SideBarItem> _getParkItems({
    required BuildContext context,
    required String currentRoute,
  }) {
    return [
      // TODO: RoutePages.splash... etc Klasse um Strings einfacher zu handhaben
      SideBarItem(
        icon: const Icon(Icons.list_alt_outlined),
        active: currentRoute == '/tasks',
        onTap: () {
          context.go('/tasks');
        },
      ),
      SideBarItem(
        icon: const Icon(Icons.book_outlined),
        active: currentRoute == '/maintenance',
        onTap: () {
          context.go('/maintenance');
        },
      ),
      SideBarItem(
        icon: const Icon(Icons.festival_outlined),
        active: false,
        onTap: () {},
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
      ),
      SideBarItem(
        icon: const Icon(Icons.book_outlined),
        active: currentRoute == '/maintenance',
        onTap: () {
          context.go('/maintenance');
        },
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
      ),
    ];
  }
}

class _Content extends StatelessWidget {
  const _Content({
    required this.title,
    required this.content,
    required this.actions,
  });

  final String title;
  final Widget content;
  final Widget? actions;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: context.ldvUiConstants.boxDecorationRounded,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Material(
                  borderRadius: context.ldvUiConstants.roundedBorderRadius,
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: context.ldvUiConstants.roundedBorderRadius,
                    onTap: () {
                      context.go('/');
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Row(
                        children: [
                          const Icon(Icons.chevron_left),
                          Consumer(
                            builder: (context, ref, child) {
                              final branch = ref.watch(clubBranchProvider);

                              return Text(
                                '${branch.toString()} - $title',
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 30,
                                  fontFamily: 'Salterio',
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                const SizedBox(width: 16),
                actions ?? const SizedBox.shrink(),
                const SizedBox(width: 16),
              ],
            ),
          ),
          Divider(
            thickness: 1.5,
            height: 1.5,
            color: context.ldvColors.black,
            radius: context.ldvUiConstants.roundedBorderRadius,
            endIndent: 16,
            indent: 16,
          ),
          const SizedBox(height: 16),

          Expanded(child: content),
        ],
      ),
    );
  }
}
