import 'package:flutter/material.dart';
import 'package:sbn/utill/styles.dart';
import 'app_constants.dart';
import 'color_resources.dart';
import 'dimensions.dart';
import 'images.dart';

class NoInternetOrDataScreen extends StatelessWidget {
  final bool isNoInternet;
  final Widget? child;
  NoInternetOrDataScreen({required this.isNoInternet, this.child});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: AppConstants.itemHeight*0.025,vertical: AppConstants.itemHeight*0.1),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height*0.025),
          color: ColorResources.getWhite(context),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(isNoInternet ? Images.no_internet : Images.no_data, width: 160, height: 160),
              SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
              DefaultTextStyle(
                style: montserratBold.copyWith(
                  fontSize: 30,
                  color: isNoInternet ? Theme.of(context).textTheme.bodyText1?.color : ColorResources.getBlack(context),
                ),
                child: Text(isNoInternet ? "Oops!" : "Sorry!",),
              ),
              SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
              DefaultTextStyle(
                textAlign: TextAlign.center,
                style: montserratRegular, child: Text(isNoInternet ? "No internet connection" : 'No data found',),
              ),
              SizedBox(height: 40),
              isNoInternet ? Container(
                height: 45,
                margin: EdgeInsets.symmetric(horizontal: 40),
                decoration: BoxDecoration(// borderRadius: BorderRadius.circular(5.0)
                    borderRadius: BorderRadius.circular(0.0), color: ColorResources.COLOR_PRIMERY),
                child: TextButton(
                  onPressed: () async {
                    // Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => SplashScreen()));
                  },
                  child: Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: Text("Try again", style: montserratMedium.copyWith(color: Theme.of(context).highlightColor, fontSize: Dimensions.FONT_SIZE_16)),
                  ),
                ),
              ) : SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}

class DataNotFoundScreen extends StatelessWidget {
  String text_message;
  DataNotFoundScreen(this.text_message);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(MediaQuery.of(context).size.height*0.015),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(Images.no_data, width: 150, height: 150),
            Row(
              children: [
                SizedBox(width: AppConstants.itemHeight*0.05,),
                Expanded(
                  child: Text(text_message,
                      textAlign: TextAlign.center,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                      style: montserratRegular.copyWith(
                          color: ColorResources.GREY.withOpacity(0.7),
                          fontSize: AppConstants.itemWidth*0.04)),
                ),
                SizedBox(width: AppConstants.itemHeight*0.04,),
              ],
            )
          ],
        ),
      ),
    );
  }
}
