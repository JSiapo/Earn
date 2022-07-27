import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
export 'package:eran_by_saving/utils/is_valid_uuid.dart' show UUIDExt;
export 'package:eran_by_saving/utils/get_icon.dart' show ToIcon;

class BasePage {
  AppBar getclearAppBar(BuildContext context,
      {double? toolbarHeight, String? title = "", List<Widget>? actions}) {
    return AppBar(
      title: title != null
          ? Text(
              title,
              style: GoogleFonts.lato(),
            )
          : null,
      toolbarHeight: toolbarHeight,
      actions: actions,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Theme.of(context).scaffoldBackgroundColor,
        //statusBarIconBrightness: Brightness.light, // For Android (dark icons)
        //statusBarBrightness: Brightness.light, // For iOS (dark icons)
      ),
    );
  }
}
