import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ldv_app/core/utils/build_context_extensions.dart';
import 'package:ldv_app/features/club_branch/domain/models/club_branch.dart';
import 'package:ldv_app/features/club_branch/providers.dart';
import 'package:ldv_app/ui/widgets/bottom_navigation_bar_mobile.dart';
import 'package:ldv_app/ui/widgets/ldv_circle_button.dart';
import 'package:ldv_app/ui/widgets/ldv_rounded_button.dart';
import 'package:ldv_app/ui/widgets/ldv_scaffold_mobile.dart';

class TasksPageMobile extends ConsumerWidget {
  const TasksPageMobile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final branch = ref.watch(clubBranchProvider);

    return LdvScaffoldMobile(
      title: context.translate.tasks,
      onBack: () => context.go(context.ldvRoutes.dashboard),
      content: Column(
        children: [
          SizedBox(
            height: 40,
            width: double.infinity,
            child: SearchBar(
              leading: const Icon(Icons.search),
              hintText: 'Aufgaben durchsuchen...',
              backgroundColor: WidgetStateColor.resolveWith(
                (states) => context.ldvColors.white,
              ),
              overlayColor: WidgetStateColor.resolveWith((states) {
                if (states.contains(WidgetState.pressed)) {
                  return context.ldvColors.grey;
                }

                if (states.contains(WidgetState.hovered)) {
                  return context.ldvColors.grey;
                }

                return context.ldvColors.white;
              }),
              side: WidgetStateBorderSide.resolveWith(
                (states) => const BorderSide(width: 1.5),
              ),
            ),
          ),
          SizedBox(height: context.ldvUiConstants.mobileSpacingBig),
          Align(
            alignment: Alignment.centerLeft,
            child: Wrap(
              spacing: context.ldvUiConstants.mobileSpacingSmall,
              alignment: WrapAlignment.start,
              children: [
                const Text(
                  'Status:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Container(
                  height: 26,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    color: context.ldvColors.bitterSweet,
                    border: Border.all(width: 1),
                    borderRadius: context.ldvUiConstants.roundedBorderRadius,
                  ),
                  child: const Text('Alle'),
                ),
                Container(
                  height: 26,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1),
                    borderRadius: context.ldvUiConstants.roundedBorderRadius,
                  ),
                  child: const Text('Offen'),
                ),
                Container(
                  height: 26,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1),
                    borderRadius: context.ldvUiConstants.roundedBorderRadius,
                  ),
                  child: const Text('Erledigt'),
                ),
                Container(
                  height: 26,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1),
                    borderRadius: context.ldvUiConstants.roundedBorderRadius,
                  ),
                  child: const Text('Verworfen'),
                ),
              ],
            ),
          ),
          SizedBox(height: context.ldvUiConstants.mobileSpacing),
          Align(
            alignment: Alignment.centerLeft,
            child: Wrap(
              spacing: context.ldvUiConstants.mobileSpacingSmall,
              alignment: WrapAlignment.start,
              children: [
                const Text(
                  'Priorität:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Container(
                  height: 26,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    color: context.ldvColors.bitterSweet,
                    border: Border.all(width: 1),
                    borderRadius: context.ldvUiConstants.roundedBorderRadius,
                  ),
                  child: const Text('Alle'),
                ),
                Container(
                  height: 26,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1),
                    borderRadius: context.ldvUiConstants.roundedBorderRadius,
                  ),
                  child: const Text('Hoch'),
                ),
                Container(
                  height: 26,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1),
                    borderRadius: context.ldvUiConstants.roundedBorderRadius,
                  ),
                  child: const Text('Normal'),
                ),
                Container(
                  height: 26,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1),
                    borderRadius: context.ldvUiConstants.roundedBorderRadius,
                  ),
                  child: const Text('Niedrig'),
                ),
              ],
            ),
          ),
          SizedBox(height: context.ldvUiConstants.mobileSpacingBig),
          Column(
            spacing: context.ldvUiConstants.mobileSpacingSmall,
            children: [
              for (final task in _mockItems) ...[
                LdvRoundedButton(
                  height: 45,
                  onTap: () {},
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      SizedBox(
                        height: 40,
                        width: double.infinity,
                        child: Row(
                          children: [
                            SizedBox(
                              width: context.ldvUiConstants.mobileSpacing,
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(
                                task['priority'],
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: task['status'] == 'Verworfen'
                                      ? context.ldvColors.dustyGray
                                      : context.ldvColors.black,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Text(
                                task['task'],
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: task['status'] == 'Verworfen'
                                      ? context.ldvColors.dustyGray
                                      : context.ldvColors.black,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Icon(
                                switch (task['status']) {
                                  'Verworfen' => Icons.cancel_outlined,
                                  _ => Icons.check_circle_outline,
                                },
                                color: switch (task['status']) {
                                  'Verworfen' => context.ldvColors.dustyGray,
                                  'Offen' => context.ldvColors.dustyGray,
                                  _ => Colors.green,
                                },
                              ),

                              /*Text(
                                task['status'],
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: task['status'] == 'Verworfen'
                                      ? context.ldvColors.dustyGray
                                      : context.ldvColors.black,
                                ),
                              ),*/
                            ),
                            SizedBox(
                              width: context.ldvUiConstants.mobileSpacing,
                            ),
                          ],
                        ),
                      ),
                      if (task['status'] == 'verworfen') ...[
                        Divider(
                          thickness: 1.5,
                          height: 1.5,
                          color: context.ldvColors.black,
                          radius: context.ldvUiConstants.roundedBorderRadius,
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
      bottomNavigationBar: switch (branch) {
        ClubBranch.park || ClubBranch.mill => const BottomNavigationBarMobile(),
        _ => null,
      },
      floatingActionButton: LdvCircleButton(
        onTap: () {},
        child: const Icon(Icons.add),
      ),
    );
  }

  List<Map<String, dynamic>> get _mockItems {
    return [
      {
        'priority': 'Normal',
        'task': 'Müll raus bringen',
        'created': '04.09.2025',
        'status': 'Offen',
      },
      {
        'priority': 'Normal',
        'task': 'Parkplatz fegen',
        'created': '01.08.2025',
        'status': 'Erledigt',
      },
      {
        'priority': 'Hoch',
        'task': 'Zu MC Donalds fahren',
        'created': '02.09.2025',
        'status': 'Verworfen',
      },
      {
        'priority': 'Hoch',
        'task': 'Mühle reparieren',
        'created': '22.07.2025',
        'status': 'Offen',
      },
      {
        'priority': 'Normal',
        'task': 'Aufgabe mit normaler Priorität',
        'created': '15.02.2025',
        'status': 'Offen',
      },
      {
        'priority': 'Niedrig',
        'task': 'Aufgabe mit niedriger Priorität',
        'created': '07.08.2025',
        'status': 'Offen',
      },
      {
        'priority': 'Hoch',
        'task': 'Noch eine abgeschlossene Aufgabe',
        'created': '01.04.2025',
        'status': 'Erledigt',
      },
      {
        'priority': 'Normal',
        'task': 'Aufgabe mit normaler Priorität',
        'created': '15.02.2025',
        'status': 'Offen',
      },
      {
        'priority': 'Niedrig',
        'task': 'Aufgabe mit niedriger Priorität',
        'created': '07.08.2025',
        'status': 'Offen',
      },
      {
        'priority': 'Hoch',
        'task': 'Noch eine abgeschlossene Aufgabe',
        'created': '01.04.2025',
        'status': 'Erledigt',
      },
      {
        'priority': 'Normal',
        'task': 'Aufgabe mit normaler Priorität',
        'created': '15.02.2025',
        'status': 'Offen',
      },
      {
        'priority': 'Niedrig',
        'task': 'Aufgabe mit niedriger Priorität',
        'created': '07.08.2025',
        'status': 'Offen',
      },
      {
        'priority': 'Hoch',
        'task': 'Noch eine abgeschlossene Aufgabe am Ende',
        'created': '01.04.2025',
        'status': 'Erledigt',
      },
    ];
  }
}
