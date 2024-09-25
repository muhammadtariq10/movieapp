import 'package:flutter/material.dart';
import 'package:movieapp/shared/app_theme.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: AppTheme.gold,
      ),
    );
  }
}
