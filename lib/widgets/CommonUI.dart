import 'dart:async';
import 'package:coffee_app_ui/UI/assets.dart';
import 'package:coffee_app_ui/UI/constraints.dart';
import 'package:coffee_app_ui/UI/screenUtil.dart';
import 'package:coffee_app_ui/UI/style.dart';
import 'package:coffee_app_ui/widgets/loadingSpinner.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CommonUI {
  static Widget profileImage({
    required VoidCallback click,
    required Color color,
    required String image,
    double boarder = 25.0,
  }) {
    return Center(
      child: Stack(
        children: [
          Container(
            height: 120,
            width: 120,
            decoration: BoxDecoration(
                border: Border.all(width: 2, color: Colors.white),
                boxShadow: [
                  BoxShadow(
                    spreadRadius: 1,
                    blurRadius: 5,
                    color: Colors.black.withOpacity(0.1),
                  )
                ],
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(image),
                )),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(120),
              ),
              child: Image.network(
                image,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return const LoadingSpinner();
                },
              ),
            ),
          ),
          Positioned(
              bottom: 0,
              right: 0,
              child: GestureDetector(
                onTap: click,
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 4,
                      color: Colors.white,
                    ),
                    color: color,
                  ),
                  child: const Icon(
                    Icons.photo_camera,
                    color: Colors.white,
                  ),
                ),
              )),
        ],
      ),
    );
  }

  static Widget loading(BuildContext context) {
    //TODO remove Scaffod
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 100,
          width: 120,
          child: Image.asset('assets/images/Ring-1.2s-200px.gif'),
        ),
      ),
    );
  }

  static Widget userImage({
    required String image,
  }) {
    return Center(
      child: Container(
        height: 120,
        width: 120,
        decoration: BoxDecoration(
            border: Border.all(width: 2, color: Colors.white),
            boxShadow: [
              BoxShadow(
                spreadRadius: 1,
                blurRadius: 5,
                color: Colors.black.withOpacity(0.1),
              )
            ],
            shape: BoxShape.circle,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(image),
            )),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(
            Radius.circular(120),
          ),
          child: Image.network(
            image,
            fit: BoxFit.cover,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return const LoadingSpinner();
            },
          ),
        ),
      ),
      //  Container(
      //   width: 120,
      //   height: 120,
      //   decoration: BoxDecoration(
      //       border: Border.all(width: 2, color: Colors.white),
      //       boxShadow: [
      //         BoxShadow(
      //           spreadRadius: 1,
      //           blurRadius: 5,
      //           color: Colors.black.withOpacity(0.1),
      //         )
      //       ],
      //       shape: BoxShape.circle,
      //       image: DecorationImage(
      //         fit: BoxFit.cover,
      //         image: NetworkImage(image),
      //       )),
      // ),
    );
  }

  static Future<void> alert(BuildContext context,
      {String title = '',
      required String msg,
      VoidCallback? onDone,
      VoidCallback? onDismiss}) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(msg),
          actions: <Widget>[
            TextButton(
              child: Text(
                MaterialLocalizations.of(context).okButtonLabel,
                style: FontStylee.normal(context: context, color: Colors.red),
              ),
              onPressed: () {
                if (onDone != null) {
                  onDone();
                }
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );

    if (onDismiss != null) {
      onDismiss();
    }
  }
//  static void showToast({
//     @required BuildContext context,
//   }) {

//     OverlayEntry overlayEntry;

//     overlayEntry = OverlayEntry(
//         builder: (context) => ToastWidget(
//         )
//     );
//     Overlay.of(context)!.insert(overlayEntry);
//     Timer(Duration(seconds: 1), () =>  overlayEntry.remove());

//   }
  static Future<void> successDialog(
    BuildContext context, {
    required String message,
  }) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        Future.delayed(const Duration(milliseconds: 300), () {
          Navigator.of(context).pop(true);
        });
        return AlertDialog(
          content: SizedBox(
            height: 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                LottieBuilder.asset(
                  AnimAssets.success,
                  height: 70,
                  repeat: false,
                ),
                Text(
                  message,
                  style: FontStylee.normal(context: context),
                ),
                // TextButton(
                //     onPressed: () => Navigator.pop(context),
                //     child: Text(
                //       MaterialLocalizations.of(context).okButtonLabel,
                //     ))
              ],
            ),
          ),
        );
        // });
        // return Container();
      },
    );
  }

  static Widget optionTextField(
      {required BuildContext context,
      required String name,
      label,
      hint,
      bool enable = true,
      int? maxlength,
      int? maxlines,
      int? minlines,
      required TextEditingController? controller,
      Widget? icon,
      bool isEdit = false,
      // keyboardType? keyboardtype = keyboardType
      String? Function(String?)? validate,
      Function(String?)? onChange,
      TextInputType? keyboardtype}) {
    return Padding(
      // padding: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(8.0),
      child: FormBuilderTextField(
        enabled: enable,
        maxLines: maxlines,
        maxLength: maxlength,
        minLines: minlines,
        name: name,
        controller: controller,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(4.0),
            // border: InputBorder.none,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: const BorderSide(color: Colors.black),
            ),
            // OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
            filled: true,
            fillColor: Colors.white,
            icon: icon,
            suffixIcon: isEdit ? const Icon(Icons.edit_outlined) : null,
            labelText: hint,
            hintText: label,
            hintStyle: FontStylee.smaller(context: context),
            enabled: true),
        onChanged: onChange,
        validator: validate,
        keyboardType: keyboardtype,
      ),
    );
  }

  static Widget textField(
      {required BuildContext context,
      required String name,
      label,
      hint,
      bool enable = true,
      int? maxlength,
      int? maxlines,
      int? minlines,
      required TextEditingController? controller,
      Widget? icon,
      bool isEdit = false,
      // keyboardType? keyboardtype = keyboardType
      String? Function(String?)? validate,
      Function(String?)? onChange,
      TextInputType? keyboardtype}) {
    return Padding(
      // padding: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(8.0),
      child: FormBuilderTextField(
        enabled: enable,
        maxLines: maxlines,
        maxLength: maxlength,
        minLines: minlines,
        name: name,
        controller: controller,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Colors.grey.withOpacity(0.5), width: 0.0),
            ),
            contentPadding: const EdgeInsets.all(8.0),
            // border: InputBorder.none,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            // OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
            filled: true,
            fillColor: Colors.white,
            icon: icon,
            suffixIcon: isEdit ? const Icon(Icons.edit_outlined) : null,
            labelText: hint,
            hintText: label,
            hintStyle: FontStylee.normal(context: context),
            enabled: true),
        onChanged: onChange,
        validator: validate,
        keyboardType: keyboardtype,
      ),
    );
  }

  static Widget profilDataCard(
      {required BuildContext context,
      String? labelText,
      String? hintText,
      String? initialValue,
      TextInputType? textInputType,
      TextEditingController? controller,
      IconData? prefixIcon,
      IconButton? suffixIcon,
      int maxLines = 1,
      bool obscureText = false,
      TextCapitalization textCapitalization = TextCapitalization.none,
      String? Function(String?)? validator,
      Function(String)? onChanged,
      Function(String?)? onSaved}) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [
            BoxShadow(
              color: Color(0x29000000),
              offset: Offset(0, 3),
              blurRadius: 6,
              spreadRadius: 0,
            ),
          ],
        ),
        child: Center(
          child: TextFormField(
            onSaved: onSaved,
            onChanged: onChanged,
            validator: validator,
            controller: controller,
            maxLines: 1,
            keyboardType: textInputType,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(bottom: 1.0),
              border: InputBorder.none,
              disabledBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              labelText: labelText,
              labelStyle: FontStylee.normal(
                  fontWeight: FontWeight.bold, context: context),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              prefixIcon: Padding(
                padding: const EdgeInsets.only(top: 6),
                child: Icon(
                  prefixIcon,
                  color: const Color(0xff454f63),
                ),
              ),
              suffixIcon: suffixIcon,
              hintText: hintText,
              hintStyle: FontStylee.normal(context: context),
            ),
          ),
        ),
      ),
    );
  }

  static Widget text({
    required BuildContext context,
    required String text,
    TextStyle? style,
    int? minLines,
    int? maxLines,
    TextAlign? textAlign = TextAlign.start,
  }) {
    if (Responsive.isDesktop(context) || Responsive.isTablet(context)) {
      return SelectableText(
        text,
        minLines: minLines,
        maxLines: maxLines,
        textAlign: textAlign,
        style:
            style ?? FontStylee.normal(context: context, color: Colors.white),
      );
    } else {
      return Text(
        text,
        maxLines: maxLines,
        textAlign: textAlign,
        softWrap: true,
        style:
            style ?? FontStylee.normal(context: context, color: Colors.white),
      );
    }
  }

  static void toast(BuildContext context, String msg,
      {Color bgColor = const Color(0xAA000000),
      Color textColor = Colors.white}) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        backgroundColor: bgColor,
        textColor: textColor,
        fontSize: 16.0);
  }

  static empty(String text) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        LottieBuilder.asset(
          AnimAssets.empty,
          height: 190,
          // repeat: false,
        ),
        Text(text),
      ],
    ));
  }

  static error(String error) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        LottieBuilder.asset(
          AnimAssets.error,
          height: 190,
          // repeat: false,
        ),
        Text(error),
      ],
    ));
  }

  static void postDelayed(
      {int milliseconds = 500, required VoidCallback callbak}) {
    Future.delayed(Duration(milliseconds: milliseconds), () {
      callbak();
    });
  }

  static Widget textButton(
      {Color? color,
      double minWidth = 140,
      double minHight = 40,
      TextStyle? textStyle,
      EdgeInsetsGeometry? padding,
      required String text,
      double boarder = 40.0, //10
      Color textColor = Colors.white,
      required VoidCallback? click}) {
    return TextButton(
        clipBehavior: Clip.antiAlias,
        style: TextButton.styleFrom(
            padding: padding,
            primary: textColor,
            backgroundColor: color,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(boarder))),
            minimumSize: Size(minWidth, minHight)),
        onPressed: click,
        child: Text(
          text,
          style: textStyle,
        ));
  }

  static Widget elevatedButton(
      {Color? color,
      double minWidth = 140,
      double minHight = 40,
      required String text,
      required BuildContext context,
      double radius = 13,
      double elevation = 3.0,
      Color textColor = Colors.white,
      Widget? icon,
      required void Function()? click}) {
    color ??= Style.primary;
    final ButtonStyle style = ElevatedButton.styleFrom(
        primary: TradersEmpireAGgreen,
        onPrimary: textColor,
        // shadowColor: color,
        elevation: elevation,
        textStyle: FontStylee.headline6(context: context),
        // shape: CommonShapes.obRounded(radius),
        minimumSize: Size(minWidth, minHight));
    return icon != null
        ? ElevatedButton.icon(
            style: style, onPressed: click, label: Text(text), icon: icon)
        : ElevatedButton(style: style, onPressed: click, child: Text(text));
  }

  static Widget outlineBtn(
      {required String text,
      double radius = 40, //16.0,
      Color? textColor,
      Color? color,
      Color? borderColor,
      TextStyle? textStyle,
      required void Function() onPressed}) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        primary: textColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(radius))),
        backgroundColor: color ?? Colors.transparent,
        side: BorderSide(color: borderColor ?? Style.background, width: 1.1),
      ),
      onPressed: onPressed,
      child: Text(text, style: textStyle),
    );
  }

  static Widget cachedImage(String? url, String ph,
      {Color? color, BoxFit fit = BoxFit.cover}) {
    return url == null
        ? Image.asset(
            ph,
            fit: fit,
          )
        : CachedNetworkImage(
            maxHeightDiskCache: 300,
            fit: fit,
            color: color,
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                Center(
                    child: CircularProgressIndicator(
                  value: downloadProgress.progress,
                  color: Theme.of(context).primaryColor,
                )),
            errorWidget: (context, url, error) => Image.asset(
                  ph,
                  fit: fit,
                ),
            imageUrl: url);
  }
  // static Widget cachedImage(String? url, String ph,
  //     {Color? color, BoxFit fit = BoxFit.cover}) {
  //   return url == null
  //       ? Image.asset(
  //           ph,
  //           fit: fit,
  //         )
  //       : CachedNetworkImage(
  //           maxHeightDiskCache: 300,
  //           fit: fit,
  //           color: color,
  //           progressIndicatorBuilder: (context, url, downloadProgress) =>
  //               Center(
  //                   child: CircularProgressIndicator(
  //                 value: downloadProgress.progress,
  //                 color: Style.primary,
  //               )),
  //           errorWidget: (context, url, error) => Image.asset(
  //                 ph,
  //                 fit: fit,
  //               ),
  //           imageUrl: url);
  // }

}
