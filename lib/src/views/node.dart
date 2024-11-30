import 'package:flutter/material.dart';
import 'package:flutter_progress_nodes/flutter_progress_nodes.dart';
import 'package:timelines_plus/timelines_plus.dart';

class NodeWidget extends StatelessWidget {
  final Node node;
  final bool isExpanded;
  final ValueChanged<bool> onExpansionChanged;
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
  final Color lineColor;

  const NodeWidget({
    super.key,
    required this.node,
    required this.isExpanded,
    required this.onExpansionChanged,
    required this.collapsedHeight,
    required this.itemHeight,
    required this.indicatorColor,
    required this.indicatorSize,
    required this.indicatorBorderColor,
    required this.indicatorBorderWidth,
    required this.containerColor,
    required this.containerBorderRadius,
    required this.containerBorderColor,
    required this.titleStyle,
    required this.subtitleStyle,
    required this.itemTitleStyle,
    required this.itemSubtitleStyle,
    required this.lineColor,
  });

  @override
  Widget build(BuildContext context) {
    final double expandedHeight = ((node.items?.length ?? 0) * itemHeight) + 36;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(width: 16),
        SizedBox(
          height: isExpanded ? expandedHeight + itemHeight : collapsedHeight,
          child: TimelineNode(
            indicator: Container(
              height: indicatorSize,
              width: indicatorSize,
              decoration: BoxDecoration(
                color: indicatorColor,
                borderRadius: BorderRadius.circular(indicatorSize / 2),
                border: Border.all(
                  color: indicatorBorderColor,
                  width: indicatorBorderWidth,
                ),
              ),
            ),
            startConnector: SolidLineConnector(
              color: lineColor,
            ),
            endConnector: SolidLineConnector(
              color: lineColor,
            ),
          ),
        ),
        const SizedBox(width: 6),
        Expanded(
          child: Padding(
            padding: const EdgeInsetsDirectional.only(end: 20.0, start: 6.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: containerBorderRadius,
                color: containerColor,
                border: Border.all(color: containerBorderColor),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(child: Text(node.title, style: titleStyle)),
                        if (node.items != null)
                          GestureDetector(
                            onTap: () => onExpansionChanged(!isExpanded),
                            child: Icon(
                              isExpanded
                                  ? Icons.keyboard_arrow_up_rounded
                                  : Icons.keyboard_arrow_down_rounded,
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    if (node.subtitle != null)
                      Text(node.subtitle!, style: subtitleStyle),
                    if (isExpanded && node.items != null)
                      Column(
                        children: List.generate(
                          node.items!.length,
                          (index) => SizedBox(
                            height: itemHeight,
                            child: Row(
                              children: [
                                const Icon(Icons.menu_book_rounded),
                                const SizedBox(width: 8),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      node.items![index].title,
                                      style: itemTitleStyle,
                                    ),
                                    Text(
                                      node.items![index].subtitle,
                                      style: itemSubtitleStyle,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
