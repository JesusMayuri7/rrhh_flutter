import 'package:auto_divider/auto_divider.dart';
import 'package:flutter/material.dart';
import 'package:rrhh_clean/app/modules/import/presenter/import_page.dart';

import '../../../../core/uitls/widgets/line_divider.dart';

class MainImportPage extends StatelessWidget {
  const MainImportPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            ImportPage(),
            AutoDivider(mainAxisExtent: 20, color: Colors.green),
            Container(
              color: Colors.green,
            )
          ],
        ),
      ),
    );
  }
}
