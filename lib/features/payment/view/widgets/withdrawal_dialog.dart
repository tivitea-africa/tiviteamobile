import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tivi_tea/features/common/app_success_content.dart';
import 'package:tivi_tea/features/payment/model/withdrawal_account_model.dart';
import 'package:tivi_tea/features/payment/view/widgets/withdrawal_dialog_step1.dart';
import 'package:tivi_tea/features/payment/view/widgets/withdrawal_dialog_step2.dart';

enum _WithdrawalDialogSteps { enterBank, confirm, success }

class WithdrawalDialog extends StatefulWidget {
  const WithdrawalDialog({super.key});

  @override
  State<WithdrawalDialog> createState() => _WithdrawalDialogState();
}

class _WithdrawalDialogState extends State<WithdrawalDialog> {
  _WithdrawalDialogSteps _currentStep = _WithdrawalDialogSteps.enterBank;

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: const Duration(milliseconds: 300),
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50),
          ),
          child: _buildViews(),
        ),
      ),
    );
  }

  Widget _buildViews() {
    switch (_currentStep) {
      case _WithdrawalDialogSteps.enterBank:
        return WithdrawalDialogStep1(
          onWithdrawalSuccess: () => _onStepChanged(
            _WithdrawalDialogSteps.success,
          ),
        );
      case _WithdrawalDialogSteps.confirm:
        return WithdrawalDialogStep2(
          withdrawalAccount: WithdrawalAccountModel(
            bankName: '',
            accountNumber: '',
            amount: 0,
          ),
          onWithdraw: () {
            _onStepChanged(_WithdrawalDialogSteps.success);
          },
        );
      case _WithdrawalDialogSteps.success:
        return AppSuccessContent(
          title: 'Withdrawal Successful',
          subtitle: 'Your withdrawal has been successful',
          buttonText: 'Go to Dashboard',
          onPressed: () => context.pop(),
        );
    }
  }

  void _onStepChanged(_WithdrawalDialogSteps step) {
    setState(() => _currentStep = step);
  }
}
