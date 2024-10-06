import 'package:animated_tree_view/animated_tree_view.dart';
import 'package:flutter/material.dart';
import 'theme.dart';

class TreePage extends StatelessWidget {
  TreeViewController? _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
      ),
      floatingActionButton: ValueListenableBuilder<bool>(
        valueListenable: sampleTree.expansionNotifier,
        builder: (context, isExpanded, _) {
          return FloatingActionButton.extended(
            onPressed: () {
              if (sampleTree.isExpanded) {
                _controller?.collapseNode(sampleTree);
              } else {
                _controller?.expandAllChildren(sampleTree);
              }
            },
            label: isExpanded
                ? const Text("Collapse all")
                : const Text("Expand all"),
          );
        },
      ),
      body: TreeView.simple(
        tree: sampleTree,
        showRootNode: true,
        expansionIndicatorBuilder: (context, node) =>
            ChevronIndicator.rightDown(
          tree: node,
          color: Colors.blue[700],
          padding: const EdgeInsets.all(8),
        ),
        indentation: const Indentation(style: IndentStyle.squareJoint),
        onItemTap: (item) {
          print("Item tapped: ${item.key}");
          print("${item}");
        },
        builder: (context, node) =>
            ItemCard(node: node), // Pass node to ItemCard
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
  final Node node; // Declare the Node parameter

  const ItemCard({
    super.key,
    required this.node, // Make it required
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: ListTile(
            title: Text("Item ${node.level}-${node.key}"),
            subtitle: Text('Level ${node.level}'),
          ),
        ),
        Expanded(
          child: Row(
            children: [
              TextButton(
                onPressed: () {},
                child: Text('Add children'),
              ),
              TextButton(
                onPressed: () {},
                child: Text('Start timer'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

final sampleTree = TreeNode.root()
  ..addAll([
    TreeNode(key: "0A")..add(TreeNode(key: "0A1A")),
    TreeNode(key: "0C")
      ..addAll([
        TreeNode(key: "0C1A"),
        TreeNode(key: "0C1B"),
        TreeNode(key: "0C1C")
          ..addAll([
            TreeNode(key: "0C1C2A")
              ..addAll([
                TreeNode(key: "0C1C2A3A"),
                TreeNode(key: "0C1C2A3B"),
                TreeNode(key: "0C1C2A3C"),
              ]),
          ]),
      ]),
    TreeNode(key: "0D"),
    TreeNode(key: "0E"),
  ]);
