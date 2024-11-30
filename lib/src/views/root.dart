import 'package:flutter/material.dart';
import 'package:flutter_progress_nodes/src/models/node.dart';
import 'package:flutter_progress_nodes/src/views/node.dart';

class ProgressNodesWidget extends StatefulWidget {
  final List<Node> nodes;
  final void Function(bool)? onToggleAll;
  final Widget? toggleAllButton;
  final double collapsedHeight;
  final double itemHeight;
  final Color indicatorColor;
  final double indicatorSize;
  final Color indicatorBorderColor;
  final double indicatorBorderWidth;
  final Color containerColor;
  final BorderRadius containerBorderRadius;
  final Color containerBorderColor;
  final TextStyle titleStyle;
  final TextStyle subtitleStyle;
  final TextStyle itemTitleStyle;
  final TextStyle itemSubtitleStyle;
  final bool isDottedLines;
  final Color lineColor;
  const ProgressNodesWidget({
    super.key,
    required this.nodes,
    this.collapsedHeight = 80,
    this.itemHeight = 60,
    this.indicatorColor = Colors.white,
    this.indicatorSize = 16,
    this.indicatorBorderColor = Colors.black,
    this.indicatorBorderWidth = 4,
    this.containerColor = Colors.white,
    this.containerBorderRadius = const BorderRadius.all(Radius.circular(12)),
    this.containerBorderColor = Colors.black,
    this.titleStyle = const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
    ),
    this.subtitleStyle = const TextStyle(
      fontSize: 14,
      color: Colors.white70,
    ),
    this.itemTitleStyle = const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.bold,
    ),
    this.itemSubtitleStyle = const TextStyle(
      fontSize: 12,
      color: Colors.white70,
    ),
    this.isDottedLines = false,
    this.lineColor = Colors.black,
    this.onToggleAll,
    this.toggleAllButton,
  });

  @override
  State<ProgressNodesWidget> createState() => _ProgressNodesWidgetState();
}

class _ProgressNodesWidgetState extends State<ProgressNodesWidget> {
  late List<bool> nodeStates;
  late bool isAllExpanded;
  @override
  void initState() {
    super.initState();
    isAllExpanded = false;
    nodeStates = List.generate(widget.nodes.length, (_) => false);
  }

  void updateNodeState(int index, bool newState) {
    setState(() {
      nodeStates[index] = newState;
      isAllExpanded = nodeStates.every((state) => state);
    });
  }

  void toggleAll() {
    setState(() {
      isAllExpanded = !isAllExpanded;
      nodeStates = List.generate(nodeStates.length, (_) => isAllExpanded);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          if (widget.toggleAllButton != null)
            GestureDetector(
              onTap: () => {
                toggleAll(),
                widget.onToggleAll?.call(isAllExpanded),
              },
              child: widget.toggleAllButton!,
            ),
          ...List.generate(
            widget.nodes.length,
            (index) => NodeWidget(
              node: widget.nodes[index],
              isExpanded: nodeStates[index],
              onExpansionChanged: (newState) => updateNodeState(
                index,
                newState,
              ),
              collapsedHeight: widget.collapsedHeight,
              itemHeight: widget.itemHeight,
              indicatorColor: widget.indicatorColor,
              indicatorSize: widget.indicatorSize,
              indicatorBorderColor: widget.indicatorBorderColor,
              indicatorBorderWidth: widget.indicatorBorderWidth,
              containerColor: widget.containerColor,
              containerBorderRadius: widget.containerBorderRadius,
              containerBorderColor: widget.containerBorderColor,
              titleStyle: widget.titleStyle,
              subtitleStyle: widget.subtitleStyle,
              itemTitleStyle: widget.itemTitleStyle,
              itemSubtitleStyle: widget.itemSubtitleStyle,
              lineColor: widget.lineColor,
            ),
          )
        ],
      ),
    );
  }
}
