import 'package:flutter/material.dart';

class ConfirmDeleteBeneficiaryModal extends StatefulWidget {
  const ConfirmDeleteBeneficiaryModal({super.key});

  @override
  State<ConfirmDeleteBeneficiaryModal> createState() => _ConfirmDeleteBeneficiaryModalState();
}

class _ConfirmDeleteBeneficiaryModalState extends State<ConfirmDeleteBeneficiaryModal> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'ConfirmDeleteBeneficiaryModal is working',
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}
