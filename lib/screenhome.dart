import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:flutter_calculator/controller/button_controller.dart';
import 'package:flutter_calculator/widget/buttonList.dart';
import 'package:flutter_calculator/widget/calcubutton.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              context.watch<ButtonController>().userInput,
                              textAlign: TextAlign.end,
                              style: GoogleFonts.rubik(
                                color: Colors.white,
                                fontSize: 25,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              context.watch<ButtonController>().answer,
                              textAlign: TextAlign.end,
                              style: GoogleFonts.rubik(
                                color: Colors.white,
                                fontSize: 50,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 65),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                color: Colors.grey,
              ),
            ),
            Expanded(
              flex: 2,
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: GridView.builder(
                    itemCount: ButtonModel().buttons.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4),
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return CustomButton(
                          isEqual: false,
                          text: ButtonModel().buttons[index],
                          buttonColor: ButtonController()
                                  .isColor(ButtonModel().buttons[index])
                              ? Colors.red[900]
                              : Colors.white10,
                          textColor: Colors.blue,
                          onTap: () =>
                              context.read<ButtonController>().allClear(),
                        );
                      }
                      if (index == 1) {
                        return CustomButton(
                          isEqual: false,
                          text: ButtonModel().buttons[index],
                          buttonColor: ButtonController()
                                  .isColor(ButtonModel().buttons[index])
                              ? Colors.redAccent
                              : Colors.white10,
                          textColor: Colors.white,
                          onTap: () =>
                              context.read<ButtonController>().clearInput(),
                        );
                      }
                      if (index == 16 || index == 17 || index == 18) {
                        return CustomButton(
                          isEqual: false,
                          text: ButtonModel().buttons[index],
                          buttonColor: ButtonController()
                                  .isColor(ButtonModel().buttons[index])
                              ? Colors.deepOrange
                              : Colors.white10,
                          textColor: Colors.white,
                          onTap: () =>
                              context.read<ButtonController>().isZero(index),
                        );
                      }

                      if (index == 19) {
                        return CustomButton(
                          isEqual: true,
                          text: ButtonModel().buttons[index],
                          buttonColor: ButtonController()
                                  .isColor(ButtonModel().buttons[index])
                              ? Colors.blueAccent
                              : Colors.white10,
                          textColor: Colors.white,
                          onTap: () {
                            try {
                              if (ButtonController().userInput.isEmpty) {
                                context.read<ButtonController>().isEmpty();
                              }
                              context
                                  .read<ButtonController>()
                                  .onTappedEqualButton();
                            } on Exception catch (e) {
                              throw Exception(e);
                            }
                          },
                        );
                      } else {
                        return CustomButton(
                          text: ButtonModel().buttons[index],
                          buttonColor: ButtonController()
                                  .isColor(ButtonModel().buttons[index])
                              ? Colors.yellow[800]
                              : Colors.white10,
                          textColor: Colors.white,
                          onTap: () => context
                              .read<ButtonController>()
                              .changeData(index),
                          isEqual: false,
                        );
                      }
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
