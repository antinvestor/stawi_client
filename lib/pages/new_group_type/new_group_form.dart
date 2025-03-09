import 'package:chamamobile/pages/new_group_type/steps/completed_step.dart';
import 'package:flutter/material.dart';
import 'package:chamamobile/l10n/l10n.dart';

import 'new_group.dart';

class CreateGroupForm extends StatelessWidget {
  final NewGroupController controller;

  const CreateGroupForm(this.controller, {super.key});

  @override
  Widget build(BuildContext context) {
    final steps = controller.generateStepsRequired(context);
    return controller.isComplete
        ? SuccessGroupCreateStep(controller)
        : Stepper(
            key: ValueKey(steps.length),
            steps: steps,
            currentStep: controller.currentStep,
            onStepContinue: () {
              if (controller.isLastStep()) {
                controller.setIsComplete();
                controller.submitAction();
              } else {
                controller.setCurrentStep(controller.currentStep + 1);
              }
            },
            onStepCancel: () {
              controller.isFirstStep
                  ? null
                  : controller.setCurrentStep(controller.currentStep - 1);
            },
            onStepTapped: (step) => controller.setCurrentStep(step),
            controlsBuilder: (context, details) => Padding(
              padding: const EdgeInsets.only(top: 32),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed:
                          controller.loading ? null : details.onStepContinue,
                      child: controller.loading
                          ? const LinearProgressIndicator()
                          : Text(
                              controller.isLastStep()
                                  ? L10n.of(context).createGroupAndInviteUsers
                                  : "Next",
                            ),
                    ),
                  ),
                  if (!controller.isFirstStep) ...[
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: details.onStepCancel,
                        child: const Text("Back"),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          );
  }
}
