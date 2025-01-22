// Function to show bottom sheet for 'Sell' tab
import 'package:flutter/material.dart';
import 'package:testt/src/configs/color/color.dart';
import 'package:testt/src/configs/extensions.dart';
import 'package:testt/src/configs/routes/routes_name.dart';
import 'package:testt/src/configs/theme/theme_text.dart';

void whatDoYouWantToSellBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Container(
        height: context.mediaQueryHeight / 2,
        color: Colors.white,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: context.mediaQueryHeight / 75),
              Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.close))
              ]),
              SizedBox(height: context.mediaQueryHeight / 35),
              Text(
                "What do you want to sell?",
                style: Themetext.headline
                    .copyWith(color: AppColors.orange, fontSize: 21),
              ),
              SizedBox(height: context.mediaQueryHeight / 35),
              Text(
                "It's free and takes less than a minute.",
                textAlign: TextAlign.center,
                style: Themetext.headline.copyWith(
                    color: AppColors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.normal),
              ),
              SizedBox(height: context.mediaQueryHeight / 35),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // sell truck
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(
                          context, RoutesName.chooseSellingPlan);
                    },
                    child: Container(
                      padding: EdgeInsets.only(top: 12),
                      width: context.mediaQueryWidth / 3.5,
                      height: context.mediaQueryHeight / 6.5,
                      decoration: BoxDecoration(
                          color: Color(0xFFfef3e8),
                          borderRadius: BorderRadius.circular(9)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 40,
                            backgroundColor: Color(0xFFfcd6aa),
                            child: Image.asset('assets/images/splash.png'),
                          ),
                          SizedBox(height: context.mediaQueryHeight / 75),
                          Text(
                            'Truck',
                            style: Themetext.blackBoldText,
                          )
                        ],
                      ),
                    ),
                  ),
                  // spare parts
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(
                          context, RoutesName.sellSparePartsScreen);
                    },
                    child: Container(
                      padding: EdgeInsets.only(top: 12),
                      width: context.mediaQueryWidth / 3.5,
                      height: context.mediaQueryHeight / 6.5,
                      decoration: BoxDecoration(
                          color: Color(0xFFe5f2ff),
                          borderRadius: BorderRadius.circular(9)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 40,
                            backgroundColor: Color(0xFFd3ebff),
                            child: Image.asset('assets/images/spare_parts.png'),
                          ),
                          SizedBox(height: context.mediaQueryHeight / 75),
                          Text(
                            'Spare Parts',
                            style: Themetext.blackBoldText,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      );
    },
  );
}
