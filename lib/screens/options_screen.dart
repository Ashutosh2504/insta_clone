import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';

class OptionsScreen extends StatefulWidget {
  const OptionsScreen({super.key});

  @override
  State<OptionsScreen> createState() => _OptionsScreenState();
}

class _OptionsScreenState extends State<OptionsScreen> {
  List profiles = ["assets/images/profile1.jpg", "assets/images/profile2.jpg"];
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(),
        Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.grey,
                        child: Icon(
                          Icons.person,
                          size: 20,
                        ),
                        radius: 20,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Ray Combs",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 6,
                ),
                BlurryContainer(
                  blur: 20,
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  elevation: 1,
                  color: Colors.transparent,
                  padding: const EdgeInsets.all(8),
                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16.0),
                        child: Image.asset(
                          "assets/images/img6.jpg",
                          height: 200.0,
                          width: 150.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Problem Identification",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              Text(
                                "Design Thinking",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.white),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.date_range_outlined,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    "19/02/2024",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Icon(
                                    Icons.access_time,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    "6:00 PM - 7:00 PM",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      //add here clipping porfile images
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        for (int i = 0;
                                            i < profiles.length;
                                            i++)
                                          Align(
                                            widthFactor: 0.5,
                                            child: CircleAvatar(
                                              radius: 18,
                                              backgroundColor: Colors.white,
                                              child: CircleAvatar(
                                                radius: 15,
                                                backgroundImage:
                                                    AssetImage(profiles[i]),
                                              ),
                                            ),
                                          ),
                                        Align(
                                          widthFactor: 1,
                                          child: CircleAvatar(
                                            radius: 18,
                                            backgroundColor: Colors.grey,
                                            child: CircleAvatar(
                                              child: Icon(
                                                Icons.add,
                                                color: Colors.white,
                                              ),
                                              backgroundColor:
                                                  Colors.transparent,
                                              radius: 15,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text(
                                      "Attending",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                              Center(
                                child: Container(
                                  height: 40,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              20.0), // Adjust border radius as needed
                                        ),
                                      ),
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.orange), // Button color
                                      padding: MaterialStateProperty.all<
                                          EdgeInsetsGeometry>(
                                        EdgeInsets.symmetric(
                                            horizontal: 20.0,
                                            vertical: 10.0), // Button padding
                                      ),
                                    ),
                                    onPressed: () {},
                                    child: const Text(
                                      "Book Now",
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        )
      ],
    );
  }
}
