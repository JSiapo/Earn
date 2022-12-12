import 'package:eran_by_saving/provider/home_provider.dart';
import 'package:eran_by_saving/route/routes.dart';
import 'package:eran_by_saving/utils/get_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
export 'package:eran_by_saving/utils/is_valid_uuid.dart' show UUIDExt;

class BasePage {
  AppBar getclearAppBar(BuildContext context,
      {double? toolbarHeight, String? title = "", List<Widget>? actions}) {
    final isDark = context.read<HomeProvider>().settings.isDark;
    return AppBar(
      title: title != null
          ? Text(
              title,
              style: GoogleFonts.lato(fontSize: 18),
            )
          : null,
      toolbarHeight: toolbarHeight,
      leading: IconButton(
          onPressed: () {
            goBack(context);
          },
          visualDensity: VisualDensity.comfortable,
          icon: getIconWidget(IconsAvailables.chevronLeft, size: 20)),
      elevation: 0,
      actions: actions,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      centerTitle: true,
      toolbarOpacity: 1,
      bottomOpacity: 0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Theme.of(context).scaffoldBackgroundColor,
        // Status bar brightness (optional)
        statusBarIconBrightness: isDark
            ? Brightness.light
            : Brightness.dark, // For Android (dark icons)
        statusBarBrightness:
            isDark ? Brightness.light : Brightness.dark, // For iOS (dark icons)
      ),
    );
  }
}
