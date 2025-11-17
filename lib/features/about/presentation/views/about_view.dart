import 'package:flutter/material.dart';
import 'package:fruits_ecommerce/core/widget/build_app_bar.dart';
import 'package:fruits_ecommerce/features/about/presentation/views/widgets/about_view_body.dart';
import 'package:fruits_ecommerce/generated/l10n.dart';

class AboutView extends StatelessWidget {
  const AboutView({super.key});

  static const routeName = '/about';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(context: context, title: S.of(context).aboutUs, showNotificationBt: false),
      body: AboutViewBody(),
    );
  }
}
