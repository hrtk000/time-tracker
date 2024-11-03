import 'package:animated_tree_view/animated_tree_view.dart';
import 'package:flutter/material.dart';
import 'theme.dart';

// class TreePage extends StatelessWidget {
//   final TreeNode treeInput;
//   TreePage({super.key, required this.treeInput});
//   TreeViewController? _controller;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Categories'),
//       ),
//       floatingActionButton: ValueListenableBuilder<bool>(
//         valueListenable: treeInput.expansionNotifier,
//         builder: (context, isExpanded, _) {
//           return FloatingActionButton.extended(
//             onPressed: () {
//               if (treeInput.isExpanded) {
//                 _controller?.collapseNode(treeInput);
//               } else {
//                 _controller?.expandAllChildren(treeInput);
//               }
//             },
//             label: isExpanded
//                 ? const Text("Collapse all")
//                 : const Text("Expand all"),
//           );
//         },
//       ),
//       body: TreeView.simple(
//         tree: treeInput,
//         showRootNode: false,
//         onTreeReady: (controller) {
//           _controller = controller; // Store the controller
//         },
//         expansionIndicatorBuilder: (context, node) =>
//             ChevronIndicator.rightDown(
//           tree: node,
//           color: Colors.blue[700],
//           padding: const EdgeInsets.all(8),
//         ),
//         indentation: const Indentation(style: IndentStyle.squareJoint),
//         onItemTap: (item) {
//           print("Item tapped: ${item.key}");
//           print("${item}");
//         },
//         builder: (context, node) =>
//             ItemCard(node: node), // Pass node to ItemCard
//       ),
//     );
//   }
// }

class TreeNodeItem extends StatelessWidget {
  final TreeNode node;
  final VoidCallback onAddChild;

  const TreeNodeItem({
    super.key,
    required this.node,
    required this.onAddChild,
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
                onPressed: onAddChild,
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

class TreePage extends StatefulWidget {
  final TreeNode treeInput; // Accepting sampleTree as a parameter

  TreePage({super.key, required this.treeInput});

  @override
  _TreePageState createState() => _TreePageState();
}

class _TreePageState extends State<TreePage> {
  TreeViewController? _controller;

  void _addChildToNode(TreeNode node) {
    final newChild = TreeNode(key: 'New Child ${node.children.length + 1}');
    node.add(newChild);
    _controller
        ?.expandNode(node); // Optionally expand the node to show the new child
    setState(() {}); // Trigger a rebuild to reflect the changes
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tree View'),
      ),
      body: TreeView.simple(
        tree: widget.treeInput, // Use the passed sampleTree
        onTreeReady: (controller) {
          _controller = controller; // Store the controller
        },
        builder: (context, node) {
          return TreeNodeItem(
            node: node,
            onAddChild: () => _addChildToNode(node),
          );
        },
      ),
    );
  }
}
