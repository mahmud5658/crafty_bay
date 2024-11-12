
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

import '../../utility/assets_path.dart';

class AppLogoWidget extends StatelessWidget {
  const AppLogoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      AssetsPath.appLogo,
      width: 100,
    );
  }
}
