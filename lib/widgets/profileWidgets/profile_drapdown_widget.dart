import 'package:flutter/material.dart';

class ProfileDropdownWidget extends StatefulWidget {
  final String label;
  final IconData icon;
  final List<String> items;
  final Color color;
  final bool required;
  final String? selectedItem;
  final Function(String?) onChanged;
  final String? Function(String?)? validator;

  const ProfileDropdownWidget({
    super.key,
    required this.label,
    required this.icon,
    required this.items,
    this.color = Colors.black,
    this.required = false,
    required this.selectedItem,
    required this.onChanged,
    this.validator,
  });

  @override
  // ignore: library_private_types_in_public_api
  _ProfileDropdownWidgetState createState() => _ProfileDropdownWidgetState();
}

class _ProfileDropdownWidgetState extends State<ProfileDropdownWidget> {
  String? _selectedItem;

  @override
  void initState() {
    super.initState();
    _selectedItem = widget.selectedItem;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: InputDecorator(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            prefixIcon: Icon(widget.icon, color: widget.color),
            filled: true,
            fillColor: Colors.white.withAlpha(204),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: _selectedItem,
              hint: Text(widget.label),
              isDense: true,
              onChanged: (newValue) {
                setState(() {
                  _selectedItem = newValue;
                });
                widget.onChanged(newValue);
              },
              items: widget.items.map((value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
