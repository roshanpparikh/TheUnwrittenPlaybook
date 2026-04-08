import 'package:flutter/material.dart';
import 'package:upwork_the_unwritten_playbook/core/navigation/page_configuration.dart';

abstract class StatelessBasePageWidget<T extends PageConfiguration> extends StatelessWidget {

  final T pageConfiguration;

  StatelessBasePageWidget(this.pageConfiguration): super(key: ValueKey(pageConfiguration.key));
}

abstract class StatefulBasePageWidget<T extends PageConfiguration> extends StatefulWidget {

  final T pageConfiguration;

  StatefulBasePageWidget(this.pageConfiguration): super(key: ValueKey(pageConfiguration.key));
}
