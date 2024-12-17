import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testt/src/configs/theme/theme_text.dart';
import '../view_model/sell_truck_view_model.dart';

class AllowWhatsappContactWidget extends StatelessWidget {
  const AllowWhatsappContactWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return // WhatsApp Contact Option (Toggle)
        Consumer<SellTuckViewModel>(
      builder: (context, provider, _) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Label
            Text('Allow contact via WhatsApp', style: Themetext.headline),

            // Toggle Switch
            Switch(
              value: provider.allowWhatsappContact,
              onChanged: (value) {
                provider.toggleWhatsappContact(value);
              },
              activeColor: Colors.green,
              inactiveThumbColor: Colors.grey,
              inactiveTrackColor: Colors.grey.shade300,
            ),
          ],
        );
      },
    );
  }
}
