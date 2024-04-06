import 'package:flutter/material.dart';
import 'package:flutter_test_vocacional_1/src/views/util/bar/components/title_component.dart';
import 'package:flutter_test_vocacional_1/src/views/util/bar/layouts/navigation_bar_menu.dart';
import 'package:flutter_test_vocacional_1/src/views/util/build_widget_screen_type/build_widget_screen_type.dart';
import 'package:flutter_test_vocacional_1/src/views/util/drawer_menu/drawer_menu.dart';
import 'package:provider/provider.dart';

enum ScreenType { mobile, tablet, desktop }

class ResponsiveDesign with ChangeNotifier {
  ScreenType _screenType = ScreenType.desktop;

  ScreenType get screenType => _screenType;

  set screenType(ScreenType value) {
    _screenType = value;
    notifyListeners();
  }

  /// Returns the screen width of the device.
  ///
  /// [context] is the BuildContext used to retrieve the screen width.
  ///
  /// The function retrieves the screen width from the MediaQuery of the given
  /// BuildContext.
  double screenWidth(BuildContext context) {
    // Retrieve the screen width from the MediaQuery of the given BuildContext.
    return MediaQuery.of(context).size.width;
  }

  /// Sets the screen type of the device based on the given BuildContext.
  ///
  /// The function checks the screen type by calling the [isDesktop], [isMobile],
  /// and [isMobileAndTablet] functions and updates the [screenType] accordingly.
  /// It also prints a debug message and notifies the listeners of the change.
  void setScreenType(BuildContext context) {
    // Check if the device is a desktop
    if (isDesktop(context)) {
      // Set the screen type to desktop
      screenType = ScreenType.desktop;
      // Print a debug message with the current screen type
      debugPrint('El tipo de pantalla es: $screenType');
    }

    // Check if the device is a mobile
    if (isMobile(context)) {
      // Set the screen type to mobile
      screenType = ScreenType.mobile;
      // Print a debug message with the current screen type
      debugPrint('El tipo de pantalla es: $screenType');
    }
    // Check if the device is a mobile and tablet (this includes other types like foldable)
    else if (isMobileAndTablet(context)) {
      // Set the screen type to tablet
      screenType = ScreenType.mobile;
      // Print a debug message with the current screen type
      debugPrint(
        'El tipo de pantalla es: $screenType, pero recordar que es para'
        ' la version de Tablets y Mobiles',
      );
    }
    notifyListeners();
  }

  // dynamic buildWidgetScreenType({
  //   required BuildContext context,
  //   Widget? widgetDesktop,
  //   Widget? widgetMobile,
  //   Widget? widgetTablet,
  //   bool isNull = false,
  // }) {
  //   setScreenType(context);

  //   Widget? selectedWidget;
  //   switch (screenType) {
  //     case ScreenType.desktop:
  //       selectedWidget = widgetDesktop;
  //       break;
  //     case ScreenType.mobile:
  //       selectedWidget = widgetMobile;
  //       break;
  //     case ScreenType.tablet:
  //       selectedWidget = widgetTablet;
  //       break;
  //     default:
  //       selectedWidget = null;
  //   }

  //   return isNull ? null : selectedWidget ?? Container();
  // }

  /// Returns the screen height of the device.
  ///
  /// [context] is the BuildContext used to retrieve the screen height.
  ///
  /// The function retrieves the screen height from the MediaQuery of the
  /// given BuildContext.

  double screenHeight(BuildContext context) {
    // Retrieve the screen height from the MediaQuery of the given BuildContext.
    return MediaQuery.of(context).size.height;
  }

  /// Constants for screen width and height.
  /// mobileWidth => 480;
  static const double mobileWidth = 480;

  /// tabletWidth => 768;
  static const double tabletWidth = 768;

  /// desktopWidth => 950;
  static const double desktopWidth = 950;

  // Constants for mobile screen widths.

  /// mobileSmall => 320;
  double get mobileSmall => 320;

  /// mobileNormal => 375;
  double get mobileNormal => 375;

  /// mobileLarge => 414;
  double get mobileLarge => 414;

  /// mobileExtraLarge => 480;
  double get mobileExtraLarge => 480;

  // Constants for tablet screen widths.
  /// tabletSmall => 600;
  double get tabletSmall => 600;

  /// tabletNormal => 768;
  double get tabletNormal => 768;

  /// tabletLarge => 900;
  double get tabletLarge => 850;

  /// ´´´tabletExtraLarge´´´ => 900;
  double get tabletExtraLarge => 900;

  //Constants for desktop screen widths.
  /// desktopSmall => 950;
  double get desktopSmall => 950;

  /// desktopNormal => 1920;
  double get desktopNormal => 1920;

  /// desktopLarge => 3840;
  double get desktopLarge => 3840;

  /// desktopExtraLarge => 4096;
  double get desktopExtraLarge => 4096;

  /// Returns whether the device is a mobile device based on the screen width.
  ///
  /// The function checks if the device's screen width is less than the
  /// [tabletWidth] constant.
  ///
  /// Parameters:
  ///   - [context]: The build context used to retrieve the screen width.
  ///
  /// Returns:
  ///   - A boolean indicating whether the device is a mobile device.
  bool isMobile(BuildContext context) {
    // Check if the device's screen width is less than the [tabletWidth]
    // constant.
    if (MediaQuery.of(context).size.width < tabletSmall) {
      screenType = ScreenType.mobile;
      return true;
    } else {
      return false;
    }
  }

  /// Returns whether the device is a tablet device based on the screen width.
  ///
  /// The function checks if the device's screen width is greater than or equal
  /// to the [tabletWidth] constant and less than the [desktopWidth] constant.
  ///
  /// Parameters:
  ///   - [context]: The build context used to retrieve the screen width.
  ///
  /// Returns:
  ///   - A boolean indicating whether the device is a tablet device.
  bool isTablet(BuildContext context) {
    // Check if the device's screen width is greater than or equal
    // to the [tabletWidth] constant and less than the [desktopWidth] constant.
    return MediaQuery.of(context).size.width >= tabletSmall &&
        MediaQuery.of(context).size.width <= desktopSmall;
  }

  /// Returns whether the device is a desktop device based on the screen width.
  ///
  /// The function checks if the device's screen width is greater than or equal
  /// to the [desktopWidth] constant.
  ///
  /// Parameters:
  ///   - [context]: The build context used to retrieve the screen width.
  ///
  /// Returns:
  ///   - A boolean indicating whether the device is a desktop device.
  bool isDesktop(BuildContext context) {
    // Check if the device's screen width is greater than or equal to the
    // [desktopWidth] constant.
    return MediaQuery.of(context).size.width >= desktopSmall;
  }

  /// Checks if the device is either a mobile or a tablet device.
  ///
  /// This function takes a [BuildContext] object as a parameter to retrieve
  /// the screen width. It uses the [isMobile] and [isTablet] functions to
  /// determine if the device is a mobile or a tablet device, respectively.
  ///
  /// Parameters:
  ///   - [context]: The build context used to retrieve the screen width.
  ///
  /// Returns:
  ///   - A boolean indicating whether the device is a mobile or a tablet
  ///     device.
  bool isMobileAndTablet(BuildContext context) {
    // The function checks if the device is a mobile device or a tablet
    // device. It uses the isMobile and isTablet functions to determine
    // the device type.
    return isMobile(context) || isTablet(context);
  }

  void initScreen(BuildContext context) {
    if (context.read<ResponsiveDesign>().isMobileAndTablet(context)) {
      //Mobile & Tablet
      debugPrint('Mobile & Tablet');
      context.read<ViewMenu>().widgetDrawer = DrawerMenu();
      if (MediaQuery.of(context).size.width < mobileLarge) {
        //mobileLarge
        debugPrint('mobileLarge');
        context.read<ResponsiveDesign>().screenType = ScreenType.mobile;

        context.read<ViewMenu>().widgetBar = Container();
      } else {
        //Tablet
        debugPrint('Tablet');
        context.read<ResponsiveDesign>().screenType = ScreenType.tablet;

        context.read<ViewMenu>().widgetBar = const Row(
          children: [
            Expanded(flex: 3, child: SizedBox(child: TitleComponent())),
          ],
        );
      }
    } else {
      //Desktop
      debugPrint('Desktop');
      context.read<ResponsiveDesign>().screenType = ScreenType.desktop;

      context.read<ViewMenu>().widgetBar = const Row(
        children: [
          Expanded(flex: 4, child: SizedBox(child: TitleComponent())),
          Expanded(
            flex: 8,
            child: SizedBox(child: NavigationBarMenu()),
          ),
        ],
      );
      context.read<ViewMenu>().widgetDrawer = null;
    }
  }
}
