import 'package:coffee_app_ui/UI/style.dart';
import 'package:coffee_app_ui/constants/countries.dart';
import 'package:coffee_app_ui/widgets/CommonUI.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({Key? key}) : super(key: key);

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final TextEditingController email = TextEditingController();
  // String dropdownvalue = 'Jordan';
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      scrollDirection: Axis.vertical,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 100),
          child: Container(
            height: MediaQuery.of(context).size.height,
            color: Colors.white,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 150.0, vertical: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('  Contact information',
                      style: TextStyle(fontSize: 20)),
                  CommonUI.textField(
                    context: context,
                    name: "email",
                    controller: email,
                    hint: " Email",
                    validate: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                      FormBuilderValidators.email(),
                    ]),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text('  Shipping address',
                      style: TextStyle(fontSize: 20)),
                  // CommonUI.textField(
                  //   context: context,
                  //   name: "email",
                  //   controller: email,
                  //   hint: " Country/Region",
                  //   validate: FormBuilderValidators.compose([
                  //     FormBuilderValidators.required(),
                  //     FormBuilderValidators.email(),
                  //   ]),
                  // ),
                  const SizedBox(
                    height: 10,
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(
                  //     horizontal: 7.0,
                  //   ),
                  //   child: Container(
                  //     padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  //     decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.circular(5.0),
                  //         color: Colors.white,
                  //         border:
                  //             Border.all(color: Colors.grey.withOpacity(0.5))),
                  //     child: DropdownButton(
                  //       isExpanded:
                  //           true, // hint: const Text(" Country/Region"),
                  //       menuMaxHeight: 300,
                  //       // Initial Value
                  //       value: dropdownvalue,

                  //       // Down Arrow Icon
                  //       icon: const Icon(Icons.keyboard_arrow_down),

                  //       // Array list of items
                  //       items: countries.map((String countries) {
                  //         return DropdownMenuItem(
                  //           alignment: Alignment.bottomLeft,
                  //           value: countries,
                  //           child: Text(
                  //             " " + countries,
                  //             style: const TextStyle(
                  //               color: Style.titleColor,
                  //             ),
                  //           ),
                  //         );
                  //       }).toList(),
                  //       // After selecting the desired option,it will
                  //       // change button value to selected value
                  //       onChanged: (String? newValue) {
                  //         setState(() {
                  //           dropdownvalue = newValue!;
                  //         });
                  //       },
                  //     ),
                  //   ),
                  // ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6.0),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton2(
                        isExpanded: true,
                        hint: const Text(
                          "Country/Region",
                          style: TextStyle(
                            fontSize: 16,
                            color: Style.titleColor,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        items: countries
                            .map((item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(
                                    item,
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black.withOpacity(0.7),
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ))
                            .toList(),
                        value: selectedValue,
                        onChanged: (value) {
                          setState(() {
                            selectedValue = value as String;
                          });
                        },
                        icon: const Icon(
                          Icons.keyboard_arrow_down,
                          size: 24,
                        ),
                        iconSize: 14,
                        iconEnabledColor: Colors.grey,
                        iconDisabledColor: Colors.grey,
                        buttonHeight: 50,
                        buttonWidth: 250,
                        buttonPadding:
                            const EdgeInsets.only(left: 12, right: 12),
                        buttonDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border:
                              Border.all(color: Colors.grey.withOpacity(0.5)),
                          color: Colors.white,
                        ),
                        // buttonElevation: 2,
                        itemHeight: 40,
                        itemPadding: const EdgeInsets.only(left: 14, right: 14),
                        dropdownMaxHeight: 200,
                        dropdownWidth: 400,
                        dropdownPadding: null,
                        dropdownDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white,
                        ),
                        dropdownElevation: 8,
                        scrollbarRadius: const Radius.circular(40),
                        scrollbarThickness: 6,
                        scrollbarAlwaysShow: true,
                        offset: const Offset(-20, 0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    ));
  }
}
