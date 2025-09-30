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
          const SizedBox(height: 16),
          Align(
            alignment: Alignment.centerLeft,
            child: Wrap(
              spacing: 8,
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
                  child: const Text('Geschlossen'),
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
          const SizedBox(height: 32),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    'Priorität',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    'Aufgabe',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    'Erstellt',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    'Status',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          Column(
            spacing: 8,
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
                            const SizedBox(width: 16),
                            Expanded(
                              flex: 2,
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
                              flex: 2,
                              child: Text(
                                task['created'],
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
                              child: Text(
                                task['status'],
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: task['status'] == 'Verworfen'
                                      ? context.ldvColors.dustyGray
                                      : context.ldvColors.black,
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
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
        // TODO: Sortieren nach! Filter sind einfach rounded boxen im content! Alternativ sortieren nach bei überschriften
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
        'status': 'Abgeschlossen',
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
        'status': 'Abgeschlossen',
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
        'status': 'Abgeschlossen',
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
        'status': 'Abgeschlossen',
      },
    ];
  }
}
