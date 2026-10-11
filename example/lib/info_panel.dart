import 'package:flutter/material.dart';

class InfoPanel extends StatelessWidget {
  final Offset firstPointerDelta;
  final Offset lastPointerDelta;
  final Offset accumulation;
  final String? additionalText;

  const InfoPanel({
    super.key,
    required this.firstPointerDelta,
    required this.lastPointerDelta,
    required this.accumulation,
    this.additionalText,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final additionalText = this.additionalText;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        spacing: 20,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'First delta: $firstPointerDelta\nLast delta: $lastPointerDelta\nAccumulation: $accumulation',
            style: theme.textTheme.headlineMedium,
          ),
          if (additionalText != null)
            Text(
              additionalText,
              style: theme.textTheme.bodySmall,
            )
        ],
      ),
    );
  }
}
