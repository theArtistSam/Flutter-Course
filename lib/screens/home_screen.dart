import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0XFFE4EAFF),
      body: Column(
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
          Padding(
            padding: const EdgeInsets.all(24),
            child: Container(
              width: width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "This is some sample text",
                      style: TextStyle(
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
                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Odio amet feugiat ut integer tincidunt sed. Fusce vulputate sed commodo, sed lorem. Mi semper orci, semper vestibulum.",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.black.withOpacity(.6),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Row(
                      children: [
                        Text("• Есть отбор",
                          style: TextStyle(
                            color: Color(0XFF0D38CE),
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(width: 16),
                        Text("• Регистрация до 21.09",
                          style: TextStyle(
                            color: Color(0XFF0D38CE),
                            fontSize: 14,
                          ),
                          ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(24),
            child: Container(
              width: width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "This is some sample text",
                      style: TextStyle(
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
                    const Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Odio amet feugiat ut integer tincidunt sed. Fusce vulputate sed commodo, sed lorem. Mi semper orci, semper vestibulum.",
                      style: TextStyle(
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
                        Text("• Есть отбор",
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(width: 16),
                        Text("• Регистрация до 21.09",
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
            ),
          )
        ],
      ),
    );
  }
}
