// import 'package:firebase_core/firebase_core.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:animated_tree_view/animated_tree_view.dart';

// final sampleTree = TreeNode.root()
//   ..addAll([
//     TreeNode(key: "0A")..add(TreeNode(key: "0A1A")),
//     TreeNode(key: "0C")
//       ..addAll([
//         TreeNode(key: "0C1A"),
//         TreeNode(key: "0C1B"),
//         TreeNode(key: "0C1C")
//           ..addAll([
//             TreeNode(key: "0C1C2A")
//               ..addAll([
//                 TreeNode(key: "0C1C2A3A"),
//                 TreeNode(key: "0C1C2A3B"),
//                 TreeNode(key: "0C1C2A3C"),
//               ]),
//           ]),
//       ]),
//     TreeNode(key: "0D"),
//     TreeNode(key: "0E"),
//   ]);

TreeNode createTreeNode() {
  List<String> fruits = ['Apple', 'Banana', 'Cherry'];
  final sampleTree = TreeNode.root();
  for (var fruit in fruits) {
    sampleTree.add(TreeNode(key: fruit));
  }
  return sampleTree;
}
