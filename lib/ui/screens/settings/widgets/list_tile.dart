import 'package:flutter/material.dart';

class CusListTile extends StatelessWidget {
  const CusListTile({
    super.key,
    required this.onTap,
    required this.title,
    this.trailing,
    required this.icon,
  });
  final VoidCallback onTap;
  final String title;
  final Widget? trailing;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      trailing: trailing,
      leading: Icon(icon),
      onTap: onTap,
    );
  }
}
