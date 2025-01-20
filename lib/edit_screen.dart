import 'package:flutter/material.dart';

class EditScreen extends StatefulWidget {
  final int index;//ค่าคีย์รายการที่ต้องการแก้ไข
  const EditScreen({super.key, required this.index});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}