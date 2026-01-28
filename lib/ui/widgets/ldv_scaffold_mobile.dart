import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ldv_app/core/utils/build_context_extensions.dart';
import 'package:ldv_app/features/branch/adapter/in/branch_cubit.dart';
import 'package:ldv_app/features/branch/domain/models/branch.dart';

class LdvScaffoldMobile extends StatelessWidget {
  const LdvScaffoldMobile({
    super.key,
    required this.title,
    required this.content,
    required this.onBack,
    this.bottomNavigationBar,
    this.floatingActionButton,
  });

  final String title;
  final Widget content;
  final VoidCallback onBack;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: context.ldvColors.white,
      appBar: _AppBar(title: title, onBack: onBack),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: context.ldvUiConstants.mobileSpacing,
                  vertical: context.ldvUiConstants.mobileSpacingBig,
                ),
                child: content,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: bottomNavigationBar,
      floatingActionButton: floatingActionButton,
    );
  }
}

class _AppBar extends StatelessWidget implements PreferredSizeWidget {
  const _AppBar({required this.title, required this.onBack});

  final String title;
  final VoidCallback onBack;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: context.ldvColors.white,
      scrolledUnderElevation: 0,
      automaticallyImplyLeading: false,
      title: Builder(
        builder: (context) {
          final branch = context.select((BranchCubit cubit) => cubit.state);
          return Row(
            children: [
              Material(
                borderRadius: context.ldvUiConstants.roundedBorderRadius,
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: context.ldvUiConstants.roundedBorderRadius,
                  onTap: onBack,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Row(
                      children: [
                        const Icon(Icons.chevron_left),
                        Text(
                          '${branch?.toL10nString()} - $title',
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Spacer(),
              switch (branch) {
                Branch.park => Image.asset(
                  'assets/images/logo_park.png',
                  height: 42,
                ),
                Branch.mill => Image.asset(
                  'assets/images/logo_mill.png',
                  height: 42,
                ),
                Branch.theater => Image.asset(
                  'assets/images/logo_theater.png',
                  height: 42,
                ),
                _ => const SizedBox.shrink(),
              },
            ],
          );
        },
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(2),
        child: Container(
          color: context.ldvColors.black,
          width: double.infinity,
          height: 1.5,
        ),
      ),
    );
  }
}
