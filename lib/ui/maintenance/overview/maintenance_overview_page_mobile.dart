import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ldv_app/core/utils/build_context_extensions.dart';
import 'package:ldv_app/features/maintenance/adapter/in/maintenance_overview_cubit.dart';
import 'package:ldv_app/features/maintenance/domain/models/maintenance_item.dart';
import 'package:ldv_app/ui/widgets/bottom_navigation_bar_mobile.dart';
import 'package:ldv_app/ui/widgets/ldv_circle_button.dart';
import 'package:ldv_app/ui/widgets/ldv_loading_spinner.dart';
import 'package:ldv_app/ui/widgets/ldv_rounded_button.dart';
import 'package:ldv_app/ui/widgets/ldv_scaffold_mobile.dart';

class MaintenanceOverviewPageMobile extends StatelessWidget {
  const MaintenanceOverviewPageMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return LdvScaffoldMobile(
      title: context.translate.maintenance,
      onBack: () => context.pop(),
      content: const _MaintenanceOverviewContent(),
      bottomNavigationBar: const BottomNavigationBarMobile(),
      floatingActionButton: LdvCircleButton(
        onTap: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _MaintenanceOverviewContent extends StatelessWidget {
  const _MaintenanceOverviewContent();

  @override
  Widget build(BuildContext context) {
    final isLoading = context.select<MaintenanceOverviewCubit, bool>(
      (value) => value.state.status.isLoading,
    );

    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      clipBehavior: Clip.none,
      child: isLoading
          ? SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.8,
              child: Center(
                child: LdvLoadingSpinner(
                  loadingHint: context.translate.maintenanceLoading,
                ),
              ),
            )
          : const _MaintenanceGridView(),
    );
  }
}

class _MaintenanceGridView extends StatelessWidget {
  const _MaintenanceGridView();

  @override
  Widget build(BuildContext context) {
    final items = context
        .select<MaintenanceOverviewCubit, List<MaintenanceItem>>(
          (value) => value.state.items,
        );

    return GridView.count(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      crossAxisCount: 2,
      padding: EdgeInsets.zero,
      mainAxisSpacing: context.ldvUiConstants.mobileSpacingSmall,
      crossAxisSpacing: context.ldvUiConstants.mobileSpacingSmall,
      clipBehavior: Clip.none,
      children: items
          .map<Widget>((item) => _GridViewButton(item: item))
          .toList(),
    );
  }
}

class _GridViewButton extends StatelessWidget {
  const _GridViewButton({required this.item});

  final MaintenanceItem item;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: context.ldvColors.black.withValues(alpha: 0.4),
            offset: const Offset(0, 4),
            spreadRadius: 0,
            blurRadius: 10,
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: context.ldvUiConstants.roundedBorderRadius,
        clipBehavior: Clip.hardEdge,
        child: LdvRoundedButton(
          height: MediaQuery.sizeOf(context).height * 0.25,
          width: double.infinity,
          onTap: () {},
          child: Padding(
            padding: EdgeInsets.all(context.ldvUiConstants.mobileSpacing),
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Column(
                  children: [
                    Container(
                      height: constraints.maxHeight * 0.85,
                      width: constraints.maxWidth,
                      decoration: context.ldvUiConstants.boxDecorationRounded(
                        withShadow: false,
                        color: context.ldvColors.dustyGrayLight,
                        borderWidth: 0.5,
                      ),
                      clipBehavior: Clip.hardEdge,
                      child: _withThumbnail
                          ? Image.network(
                              item.thumbnail?.url ?? '',
                              errorBuilder: (context, error, stackTrace) {
                                return const Icon(
                                  Icons.construction_outlined,
                                  size: 45,
                                );
                              },
                              fit: BoxFit.cover,
                            )
                          : const Icon(Icons.construction_outlined, size: 45),
                    ),
                    const Spacer(),
                    Text(item.title, overflow: TextOverflow.ellipsis),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  bool get _withThumbnail => item.thumbnail != null;
}
