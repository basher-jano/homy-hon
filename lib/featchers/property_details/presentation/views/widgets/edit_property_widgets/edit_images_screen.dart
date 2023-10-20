import 'package:flutter/material.dart';
import 'package:homy_hon/core/widgets/custom_app_bar.dart';
import 'package:homy_hon/featchers/property_details/data/models/property_details_model.dart';
import 'package:homy_hon/featchers/property_details/presentation/views/widgets/edit_property_widgets/custom_edit_images_slider.dart';

class EditImagesScreen extends StatelessWidget {
  const EditImagesScreen({
    super.key,
    required this.property,
  });
  final Property property;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          CustomAppBar(title: 'Edit Images', arrow_back: true),
          const SizedBox(height: 20),
          CustomEditImagesSlider(
            imageList: property.list.images,
            property: property,
          ),
        ],
      ),
    ));
  }
}
