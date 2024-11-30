import 'package:flutter/material.dart';
import 'package:flutter_progress_nodes/flutter_progress_nodes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Progress Nodes',
      home: ExampleApp(),
    );
  }
}

class ExampleApp extends StatefulWidget {
  const ExampleApp({super.key});

  @override
  State<ExampleApp> createState() => _ExampleAppState();
}

class _ExampleAppState extends State<ExampleApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 16.0),
            child: Text(
              'Flutter Progress Nodes',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          ProgressNodesWidget(
            nodes: [
              Node(
                title: 'Node 1',
                items: [
                  NodeItem(
                    title: 'Item 1',
                    subtitle: 'Subtitle 1',
                  ),
                  NodeItem(
                    title: 'Item 2',
                    subtitle: 'Subtitle 2',
                  ),
                  NodeItem(
                    title: 'Item 3',
                    subtitle: 'Subtitle 3',
                  ),
                  NodeItem(
                    title: 'Item 2',
                    subtitle: 'Subtitle 2',
                  ),
                  NodeItem(
                    title: 'Item 3',
                    subtitle: 'Subtitle 3',
                  ),
                ],
              ),
              Node(
                title: 'Node 2',
              ),
            ],
          )
        ],
      ),
    );
  }
}
