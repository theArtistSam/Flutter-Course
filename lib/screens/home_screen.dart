import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

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
                Image.asset(
                  'assets/images/background.png',
                  fit: BoxFit.fitWidth,
                  width: width,
                  height: 235,
                ),
                // Positioned is only used in stack
                const Positioned(
                  bottom: 0,
                  child: Padding(
                    padding: EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "This is some sample text",
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "This is some sample text",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                            color: Colors.white,
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
  // {namedParameter}
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
