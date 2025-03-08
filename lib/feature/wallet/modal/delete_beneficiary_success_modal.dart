import 'package:flutter/material.dart';

class DeleteBeneficiarySuccessModal extends StatefulWidget {
  const DeleteBeneficiarySuccessModal({super.key});

  @override
  State<DeleteBeneficiarySuccessModal> createState() => _DeleteBeneficiarySuccessModalState();
}

class _DeleteBeneficiarySuccessModalState extends State<DeleteBeneficiarySuccessModal> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'DeleteBeneficiarySuccessModal is working',
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}
