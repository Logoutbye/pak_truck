import 'package:flutter/material.dart';
import 'package:testt/src/configs/color/color.dart';
import 'package:testt/src/configs/components/round_button.dart';
import 'package:testt/src/configs/extensions.dart';

Future<void> showSelectionModal({
  required BuildContext context,
  required List<String> items,
  required String title,
  required String hintText,
  required ValueChanged<String> onItemSelected,
}) async {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    showDragHandle: true,
    enableDrag: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (context) {
      TextEditingController searchController = TextEditingController();
      List<String> filteredItems = items;

      return StatefulBuilder(
        builder: (context, setState) {
          return Container(
            constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.7),
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Container(
                  height: context.mediaQueryHeight / 18,
                  decoration: BoxDecoration(
                    color: AppColors.greyLight,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppColors.grey),
                  ),
                  child: TextField(
                    controller: searchController,
                    onChanged: (value) {
                      setState(() {
                        filteredItems = items
                            .where((item) => item
                                .toLowerCase()
                                .contains(value.toLowerCase()))
                            .toList();
                      });
                    },
                    style: TextStyle(fontSize: 14),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 10),
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      border: InputBorder.none,

                      hintText: hintText,
                      hintStyle: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w200,
                        fontSize: 15,
                      ),
                      filled: true,
                      fillColor: Colors.transparent,
                      // Add the leading and trailing widgets
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: filteredItems.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          filteredItems[index],
                          style: TextStyle(fontSize: 14),
                        ),
                        onTap: () {
                          onItemSelected(filteredItems[index]);
                          Navigator.pop(context);
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      );
    },
  );
}

Future<void> showDynamicCategoryModal({
  required BuildContext context,
  required String title,
  required Map<String, List<String>> data, // Parent-Child Data
  required ValueChanged<String> onItemSelected,
}) async {
  String? selectedParent;
  String? selectedChild;

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    showDragHandle: true,
    enableDrag: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return Container(
            constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.9),
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                const SizedBox(height: 12),

                // Parent Categories (Radio List)
                Expanded(
                  child: ListView(
                    shrinkWrap: true,
                    children: data.keys.map((parent) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Parent as Radio Button
                          RadioListTile<String>(
                            title: Text(
                              parent,
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.primaryColor),
                            ),
                            value: parent,
                            groupValue: selectedParent,
                            onChanged: (value) {
                              setState(() {
                                selectedParent = value;
                                selectedChild = null; // Reset child
                              });
                            },
                          ),

                          // Child Categories (Indented)
                          if (selectedParent == parent)
                            Padding(
                              padding: const EdgeInsets.only(left: 32.0),
                              child: Column(
                                children: data[parent]!
                                    .map((child) => RadioListTile<String>(
                                          title: Text(
                                            child,
                                            style: const TextStyle(
                                                fontSize: 14,
                                                color: AppColors.checkboxColor),
                                          ),
                                          value: child,
                                          groupValue: selectedChild,
                                          onChanged: (value) {
                                            setState(() {
                                              selectedChild = value;
                                            });
                                          },
                                        ))
                                    .toList(),
                              ),
                            ),
                        ],
                      );
                    }).toList(),
                  ),
                ),

                // Confirm Button
                const SizedBox(height: 16),

                Center(
                  child: RoundButton(
                      title: title,
                      onPress: () {
                        if (selectedParent != null && selectedChild != null) {
                          onItemSelected("$selectedParent - $selectedChild");
                          Navigator.pop(context);
                        }
                      }),
                )
              ],
            ),
          );
        },
      );
    },
  );
}
