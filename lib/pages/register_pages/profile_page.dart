import 'package:exam2/pages/main_controller_page.dart';
import 'package:exam2/widgets/forms/user_form.dart';
import 'package:exam2/widgets/register_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

const List<String> list = [
  'example@gmail.com',
  'seen@gmail.ru',
  's@agmail.com',
  'future@gmail.com'
];

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String dropdownValue = list.first;
  TextEditingController _usernameController = TextEditingController();
  Widget inputTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Text(
        title,
        style: const TextStyle(
          color: Color(0xff091130),
          fontSize: 20.0,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 80, left: 20.0, right: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Complete Your Profile",
                style: TextStyle(
                  fontSize: 35.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff000929),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  "Don’t worry, only you ca see your personal data. No one else will be able to see it.",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const Gap(20.0),
              SvgPicture.asset("assets/svg/profile.svg"),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  inputTitle("Username"),
                  MyTitleField(
                    hindText: "Username",
                    controller: _usernameController,
                  ),
                  inputTitle("Phone Number"),
                  Container(
                    padding: const EdgeInsets.only(left: 10.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xff6A6A6A)),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: InternationalPhoneNumberInput(
                      onInputChanged: (PhoneNumber number) {
                        print(number.phoneNumber);
                      },
                      inputDecoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        hintText: "Phone number",
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      selectorConfig: const SelectorConfig(
                        selectorType: PhoneInputSelectorType.DIALOG,
                      ),
                      ignoreBlank: false,
                      autoValidateMode: AutovalidateMode.disabled,
                      formatInput: true,
                    ),
                  ),
                  inputTitle("Select Email"),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xff6A6A6A)),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15.0,
                        vertical: 2.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            dropdownValue,
                            style: const TextStyle(
                              color: Color(0xff6A6A6A),
                              fontSize: 15,
                            ),
                          ),
                          DropdownButton<String>(
                            icon: const Icon(Icons.keyboard_arrow_down_rounded),
                            onChanged: (String? value) {
                              setState(() {
                                dropdownValue = value!;
                              });
                            },
                            items: list.map<DropdownMenuItem<String>>(
                              (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              },
                            ).toList(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const Gap(30.0),
              Column(
                children: [
                  MyButton(
                      title: "Complete profile",
                      onPressed: () {
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                            builder: (context) => MainControllerPage(),
                          ),
                          (Route<dynamic> route) => false,
                        );
                      }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
