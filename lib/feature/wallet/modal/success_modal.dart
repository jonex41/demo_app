import 'package:flutter/material.dart';

class AddBankSuccessModal extends StatefulWidget {
  const AddBankSuccessModal({super.key});

  @override
  State<AddBankSuccessModal> createState() => _AddBankSuccessModalState();
}

class _AddBankSuccessModalState extends State<AddBankSuccessModal> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'AddBankSuccessModal is working',
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}
