import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Theme Preview', style: textTheme.headlineSmall),
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_6),
            onPressed: () {
              // TODO: Implement theme switching
              debugPrint('Theme switch pressed');
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Color Scheme
            Text('Color Scheme', style: textTheme.headlineMedium),
            const SizedBox(height: 16),
            _buildColorBox('Primary', colorScheme.primary),
            _buildColorBox('Secondary', colorScheme.secondary),
            _buildColorBox('Surface', colorScheme.surface),
            _buildColorBox('Background', colorScheme.background),
            _buildColorBox('Error', colorScheme.error),
            const SizedBox(height: 24),

            // Headlines
            Text('Headlines', style: textTheme.headlineMedium),
            const SizedBox(height: 8),
            Text('Headline Large', style: textTheme.headlineLarge),
            Text('Headline Medium', style: textTheme.headlineMedium),
            Text('Headline Small', style: textTheme.headlineSmall),
            const SizedBox(height: 24),

            // Body Text
            Text('Body Text', style: textTheme.headlineMedium),
            const SizedBox(height: 8),
            Text('Body Large - This is a sample of body large text that demonstrates the theme styling.',
                style: textTheme.bodyLarge),
            const SizedBox(height: 8),
            Text('Body Medium - This is a sample of body medium text that demonstrates the theme styling.',
                style: textTheme.bodyMedium),
            const SizedBox(height: 24),

            // Buttons
            Text('Buttons', style: textTheme.headlineMedium),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () {
                debugPrint('Text Button pressed');
              },
              child: const Text('Text Button'),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                debugPrint('Elevated Button pressed');
              },
              child: const Text('Elevated Button'),
            ),
            const SizedBox(height: 24),

            // Cards
            Text('Cards', style: textTheme.headlineMedium),
            const SizedBox(height: 16),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Card Title', style: textTheme.headlineSmall),
                    const SizedBox(height: 8),
                    Text('This is a sample card that demonstrates the theme styling.',
                        style: textTheme.bodyMedium),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildColorBox(String label, Color color) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Container(
            width: 100,
            height: 40,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey),
            ),
          ),
          const SizedBox(width: 16),
          Text(label),
          const SizedBox(width: 8),
          Text(color.value.toRadixString(16).toUpperCase()),
        ],
      ),
    );
  }
} 