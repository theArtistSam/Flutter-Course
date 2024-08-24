import 'package:flutter/material.dart';
import 'package:flutter_app/screens/detailed_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Put the variable outside the class to make it
  // global and accessable for set State
  bool isTapped = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    String name = "Andrew Garfield";

    return Scaffold(
      backgroundColor: const Color(0XFFE4EAFF),
      // make an entire screen scrollable
      body: SingleChildScrollView(
        // the behavior of the scroll mechanism
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          // CrossAxisAlignment: from top to bottom
          // MainAxisAlignment: from left to right
          children: [
            // put widgets on top of each other
            Stack(
              children: [
                GestureDetector(
                  onTap: () {
                    // Call set State to update the state of the image
                    setState(() {
                      isTapped = !isTapped;
                    });
                  },
                  // For animation purposes, we are going to use
                  // AnimatedContainer
                  child: AnimatedContainer(
                    // Ternary Operator for check the state of a widget
                    height: isTapped ? height / 2 : 235,
                    duration: const Duration(seconds: 3),
                    child: Image.asset(
                      'assets/images/background.png',
                      fit: BoxFit.cover,
                      width: width,
                    ),
                  ),
                ),
                // Positioned is only used in stack
                //
                AnimatedPositioned(
                  duration: const Duration(seconds: 3),
                  right: isTapped ? 0 : width - 250,
                  bottom: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: isTapped
                          ? CrossAxisAlignment.end
                          : CrossAxisAlignment.start,
                      children: [
                        AnimatedDefaultTextStyle(
                          duration: const Duration(seconds: 3),
                          style: TextStyle(
                            fontSize: isTapped ? 42 : 28,
                            fontWeight: FontWeight.bold,
                            color: isTapped ? Colors.amber : Colors.white,
                          ),
                          child: Text(
                            name,
                          ),
                        ),
                        const Text(
                          "This is some sample text",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        // Use Gesture Detector to make
                        // any widget tapable.
                        GestureDetector(
                          onTap: () {
                            // Material pushes the "NEW SCREEN"
                            // with in the stack
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    DetailedScreen(name: name),
                              ),
                            );
                          },
                          child: Container(
                            color: Colors.blue,
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text("Next Screen"),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            // ListView is scrollable
            // Use this to make a seciton on the screen
            // scrollable
            SizedBox(
              height: height - 235,
              // child: ListView(
              //   children: [
              //     card(
              //       title: "This is some sample title 1",
              //       description: "This is some sample description 1",
              //     ),
              //     card(
              //       title: "This is some sample title 2",
              //       description: "This is some sample description 2",
              //     ),
              //     card(
              //       title: "This is some sample title 3",
              //       description: "This is some sample description 3",
              //     ),
              //     card(
              //       title: "This is some sample title 4",
              //       description: "This is some sample description 4",
              //     ),
              //   ],
              // ),

              // child: ListView.builder(
              //   // For apple devices bouncy scrolling animation
              //   padding: const EdgeInsets.all(24),
              //   physics: const BouncingScrollPhysics(),
              //   itemCount: 5,
              //   itemBuilder: (context, index) {
              //     return card(
              //       // String interpolation
              //       title: "This is a sample title ${index + 1}",
              //       description: "this a sample description ${index + 1}",
              //     );
              //   },
              // ),

              child: ListView.separated(
                padding: const EdgeInsets.all(24),
                // For apple devices bouncy scrolling animation
                physics: const BouncingScrollPhysics(),
                itemCount: 5,
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 15);
                },
                itemBuilder: (context, index) {
                  return card(
                    // String interpolation
                    title: "This is a sample title ${index + 1}",
                    description: "this a sample description ${index + 1}",
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  // create a local widget
  Widget card({title, description}) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              "This is some sample text",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Colors.black.withOpacity(.6),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0XFFE4EAFF),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 5,
                    ),
                    child: Text("Дизайн"),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0XFFE4EAFF),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 5,
                    ),
                    child: Text("Дизайн"),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0XFFE4EAFF),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 5,
                    ),
                    child: Text("Дизайн"),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              description,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                //color: Colors.black.withOpacity(.6),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Row(
              children: [
                Text(
                  "• Есть отбор",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 14,
                  ),
                ),
                SizedBox(width: 16),
                Text(
                  "• Регистрация до 21.09",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 14,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
