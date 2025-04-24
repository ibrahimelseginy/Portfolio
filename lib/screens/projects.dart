import 'package:flutter/material.dart';
import 'package:portfolio/firebase/analytics.dart';
import 'package:portfolio/sizes.dart';
import 'package:portfolio/widgets/projectView.dart';
import 'package:portfolio/widgets/widgets.dart';

class Projects extends StatefulWidget {
  const Projects({Key? key}) : super(key: key);

  @override
  State<Projects> createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth(context, mulBy: 1),
      //height: screenHeight(context)-70,  ///Reducing 70 for appbar
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
        Color(0xff0c0c0c),
        Color(0xff0f1617),
        Color(0xff0c0c0c),
      ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
      //color: Colors.green,
      constraints: BoxConstraints(
        minWidth: 500,
        minHeight: screenHeight(context),
      ),
      padding: EdgeInsets.symmetric(
          horizontal: screenWidth(context, mulBy: 0.05),
          vertical: screenHeight(context, mulBy: 0.07)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Texter(
            "Open Source Projects",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 34,
                color: Theme.of(context).secondaryHeaderColor),
          ),
          const SizedBox(
            height: 35,
          ),
          const Wrap(
            direction: Axis.horizontal,
            crossAxisAlignment: WrapCrossAlignment.center,
            alignment: WrapAlignment.spaceEvenly,
            runAlignment: WrapAlignment.spaceEvenly,
            spacing: 100,
            runSpacing: 40,
            children: [
              ProjectItem(
                name: "Islami",
                image: "images/Islami.png",
                projectDetails: ProjectDetails(
                  name: "Islami",
                  image: "images/Islami.png",
                  altText: "Home screen of Isalmi App",
                  desc:
                      "\u{25ca} Islami App, you can read the entire Holy Quran, explore a collection of authentic hadiths, engage in dhikr \n"
                      "\u{25ca} Dark and Light Mode \n"
                      "\u{25ca} Tech stack: Flutter, dart, Shared Preferences Provider.\n ",
                  github: "https://github.com/ibrahimelseginy/Islami",
                  link: "https://github.com/ibrahimelseginy/Islami",
                ),
              ),
              ProjectItem(
                name: "ToDo",
                image: "images/Todo.png",
                imageFit: BoxFit.contain,
                projectDetails: ProjectDetails(
                  name: "ToDo",
                  image: "images/Todo.png",
                  altText: "Home screen of ToDo .",
                  desc:
                      "\u{25ca} ToDo App is a Flutter-based task manager that helps users organize daily tasks efficiently with secure Firebase authentication.\n"
                      "\u{25ca} Users can add, edit, and delete tasks.\n"
                      "\u{25ca} Dark and Light Mode.\n"
                      "\u{25ca} Tech stack:Flutter , Auth , Shared Preferences Provider \n",
                  github: "https://github.com/ibrahimelseginy/ToDo",
                  link: "https://github.com/ibrahimelseginy/ToDo",
                ),
              ),
              ProjectItem(
                name: "News",
                image: "images/News.png",
                projectDetails: ProjectDetails(
                  name: "News",
                  image: "images/News.png",
                  altText: "Home screen of News by Ibrahim Elseginy.\n",
                  desc:
                      "\u{25ca} This project is your gateway to a dynamic news experience,offering users access to news of all kinds,Whether you're interested in politics,sports,technology,or entertainment,this app has you covered! 🌟.\n"
                      "\u{25ca} Search Functionality.\n"
                      "\u{25ca} Used Provider for managing the state.\n"
                      "\u{25ca} Tech stack: Flutter , Responsive Design , REST APIs and JSON",
                  github: "https://github.com/ibrahimelseginy/News",
                  link: "https://github.com/ibrahimelseginy/News",
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class ProjectItem extends StatelessWidget {
  const ProjectItem(
      {Key? key,
      required this.name,
      required this.image,
      this.imageFit = BoxFit.cover,
      required this.projectDetails})
      : super(key: key);

  final String image, name;
  final BoxFit imageFit;
  final ProjectDetails projectDetails;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        AnalyticsService.logProject(
          projectDetails.name,
        );
        showDialog(
          barrierColor: const Color(0x98021a2d),
          context: context,
          builder: (context) {
            return ProjectView(
              name: projectDetails.name,
              image: projectDetails.image,
              altText: projectDetails.altText,
              link: projectDetails.link,
              desc: projectDetails.desc,
              github: projectDetails.github,
            );
          },
        );
      },
      child: Column(
        children: [
          Container(
            width: 260,
            height: 180,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(
                color: const Color(0xff0c0c0c),
                borderRadius: BorderRadius.circular(15),
                boxShadow: const [
                  BoxShadow(
                      color: Color(0x2dffffff), spreadRadius: 3, blurRadius: 15)
                ]),
            child: Imager(
              path: image,
              altText: "Project item image which shows $image.",
              imageFit: imageFit,
              alignment: Alignment.center,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Texter(
            name,
            style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 24,
                fontFamily: "Gilroy",
                color: Color(0xffffffff)),
            textAlign: TextAlign.left,
          )
        ],
      ),
    );
  }
}

class ProjectDetails {
  final String image, altText, desc, github, link, name;

  const ProjectDetails(
      {required this.image,
      required this.altText,
      required this.desc,
      required this.github,
      required this.name,
      required this.link});
}
