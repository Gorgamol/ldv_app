import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ldv_app/core/theme/ldv_colors.dart';
import 'package:ldv_app/core/utils/build_context_extensions.dart';
import 'package:ldv_app/features/shared/models/side_bar_item.dart';
import 'package:ldv_app/ui/widgets/ldv_circle_button.dart';
import 'package:ldv_app/ui/widgets/ldv_scaffold_desktop.dart';

class TasksPageDesktop extends StatelessWidget {
  const TasksPageDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return LdvScaffoldDesktop(
      title: context.translate.tasksList,
      actions: Row(
        spacing: 16,
        children: [
          SizedBox(
            height: 40,
            width: 350,
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
          LdvCircleButton(
            onTap: () {},
            // TODO: Sortieren nach! Filter sind einfach rounded boxen im content! Alternativ sortieren nach bei überschriften
            child: const Icon(Icons.add),
          ),
        ],
      ),
      content: Column(
        children: [
          const SizedBox(height: 100),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    'Priorität',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  flex: 5,
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
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
              child: Container(
                decoration: context.ldvUiConstants.boxDecorationRounded
                    .copyWith(boxShadow: []),
                clipBehavior: Clip.hardEdge,
                child: ListView.separated(
                  itemCount: _mockItems.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Stack(
                          alignment: AlignmentDirectional.center,
                          children: [
                            SizedBox(
                              height: 40,
                              width: double.infinity,
                              child: Row(
                                children: [
                                  const SizedBox(width: 16),
                                  Expanded(
                                    flex: 1,
                                    child: Text(
                                      _mockItems[index]['priority'],
                                      style: TextStyle(
                                        color:
                                            _mockItems[index]['status'] ==
                                                'Verworfen'
                                            ? context.ldvColors.dustyGray
                                            : context.ldvColors.black,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 5,
                                    child: Text(
                                      _mockItems[index]['task'],
                                      style: TextStyle(
                                        color:
                                            _mockItems[index]['status'] ==
                                                'Verworfen'
                                            ? context.ldvColors.dustyGray
                                            : context.ldvColors.black,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      _mockItems[index]['created'],
                                      style: TextStyle(
                                        color:
                                            _mockItems[index]['status'] ==
                                                'Verworfen'
                                            ? context.ldvColors.dustyGray
                                            : context.ldvColors.black,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Text(
                                      _mockItems[index]['status'],
                                      style: TextStyle(
                                        color:
                                            _mockItems[index]['status'] ==
                                                'Verworfen'
                                            ? context.ldvColors.dustyGray
                                            : context.ldvColors.black,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                ],
                              ),
                            ),
                            if (_mockItems[index]['status'] == 'Verworfen') ...[
                              Divider(
                                thickness: 1.5,
                                height: 1.5,
                                color: context.ldvColors.dustyGray,
                                radius:
                                    context.ldvUiConstants.roundedBorderRadius,
                                endIndent: 6,
                                indent: 6,
                              ),
                            ],
                          ],
                        ),
                        if (_mockItems[index]['task'] ==
                            _mockItems.last['task']) ...[
                          Divider(
                            thickness: 1.5,
                            height: 1.5,
                            color: context.ldvColors.black,
                            radius: context.ldvUiConstants.roundedBorderRadius,
                          ),
                        ],
                      ],
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider(
                      thickness: 1.5,
                      height: 1.5,
                      color: context.ldvColors.black,
                      radius: context.ldvUiConstants.roundedBorderRadius,
                    );
                  },
                ),
              ),
            ),
          ),
        ],
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
