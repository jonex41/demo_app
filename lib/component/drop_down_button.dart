import 'package:flutter/material.dart';

class CustomDropDownButton extends StatelessWidget {
  final String? value;
  final String? hint;
  final List<String>? items;
  final GlobalKey<FormFieldState>? keyVal;
  final Function(dynamic value)? onChanged;
  final String? Function(String?)? validator;
  const CustomDropDownButton(
      {Key? key,
      this.value,
      this.hint,
      this.items,
      this.onChanged,
      this.keyVal,
      this.validator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      alignedDropdown: true,
      child: DropdownButtonFormField<String>(
        key: keyVal,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          contentPadding: const EdgeInsets.only(
            right: 10,
            left: 10,
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 1.0),
            borderRadius: BorderRadius.all(
              Radius.circular(5.0),
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 1.0),
            borderRadius: BorderRadius.all(
              Radius.circular(5.0),
            ),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 1.0),
            borderRadius: BorderRadius.all(
              Radius.circular(5.0),
            ),
          ),
          errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 1, color: Colors.red),
              borderRadius: BorderRadius.circular(5)),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Select an Option';
          } else {
            return null;
          }
        },
        icon: const Icon(
          Icons.keyboard_arrow_down_rounded,
        ),
        value: value,
        isExpanded: true,
        isDense: true,
        items: items?.map((String item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(item),
          );
        }).toList(),
        onChanged: onChanged,
        hint: Text(
          hint ?? '',
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
