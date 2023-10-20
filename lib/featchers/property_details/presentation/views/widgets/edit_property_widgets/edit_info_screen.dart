import 'package:flutter/material.dart';
import 'package:homy_hon/constants.dart';
import 'package:homy_hon/core/utils/textStyles.dart';
import 'package:homy_hon/core/widgets/custom_app_bar.dart';
import 'package:homy_hon/core/widgets/custom_button.dart';
import 'package:homy_hon/core/widgets/custom_radio_button.dart';
import 'package:homy_hon/core/widgets/custom_rounded_icon.dart';
import 'package:homy_hon/featchers/property_details/presentation/views/widgets/edit_property_widgets/custom_edit_bool_info.dart';
import 'package:homy_hon/featchers/property_details/presentation/views/widgets/edit_property_widgets/custom_edit_info_textfield.dart';

class EditInfoScreen extends StatelessWidget {
  EditInfoScreen({
    super.key,
    required this.extra,
  }) {
    name = extra[0] as String;
    type = extra[1] as String;
    content = extra[2] as String;
    propertyId = extra[3] as int;
    icon = extra[4] as IconData;
    propertyType = extra[5] as String;
  }
  final List<Object> extra;
  late String name;
  late String content;
  late IconData icon;
  late String type;
  late int propertyId;
  late String propertyType;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            CustomAppBar(title: 'Edit info', arrow_back: true),
            const SizedBox(height: 10),
            Builder(
              builder: (context) {
                if (type == 'string') {
                  return CustomEditInfoTextField(
                    propertyType: propertyType,
                    propertyId: propertyId,
                    isNumber: false,
                    icon: icon,
                    name: name,
                    content: content,
                    type: 'string',
                  );
                } else if (type == 'int') {
                  return CustomEditInfoTextField(
                    propertyType: propertyType,
                    propertyId: propertyId,
                    isNumber: true,
                    icon: icon,
                    name: name,
                    content: content,
                    type: 'int',
                  );
                } else {
                  return CustomEditBoolInfo(
                    propertyId: propertyId,
                    propertyType: propertyType,
                    icon: icon,
                    name: name,
                    content: content,
                  );
                }
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
