import 'package:flutter/material.dart';
import 'package:stawi/config/themes.dart';
import 'package:stawi/l10n/l10n.dart';
import 'package:stawi/pages/finance/group_configuration/new_group_type.dart';
import 'package:stawi/pages/finance/group_configuration/new_group_type_form.dart';
import 'package:stawi/utils/localized_exception_extension.dart';
import 'package:stawi/widgets/layouts/max_width_body.dart';

class NewGroupTypeView extends StatelessWidget {
  final NewGroupTypeController controller;

  const NewGroupTypeView(this.controller, {super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final error = controller.error;

    return Scaffold(
      appBar: AppBar(
        leading: Center(
          child: BackButton(
            onPressed: controller.loading ? null : Navigator.of(context).pop,
          ),
        ),
        title: Text(L10n.of(context).groupConfiguration),
      ),
      body: MaxWidthBody(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              AnimatedSize(
                duration: FluffyThemes.animationDuration,
                curve: FluffyThemes.animationCurve,
                child: NewGroupTypeForm(controller),
              ),
              AnimatedSize(
                duration: FluffyThemes.animationDuration,
                curve: FluffyThemes.animationCurve,
                child:
                    error == null
                        ? const SizedBox.shrink()
                        : ListTile(
                          leading: Icon(
                            Icons.warning_outlined,
                            color: theme.colorScheme.error,
                          ),
                          title: Text(
                            error.toLocalizedString(context),
                            style: TextStyle(color: theme.colorScheme.error),
                          ),
                        ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
