import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:on_reserve/Components/revenue_counter.dart';
import 'package:on_reserve/Controllers/my_companies_controller.dart';
import 'package:on_reserve/helpers/routes.dart';

class MyCompanies extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    int columnCount = 1;
    var controller = Get.put(MyCompaniesController());

    return Scaffold(
      appBar: AppBar(
        title: Text("My Companies"),
        centerTitle: true,
      ),
      body: AnimationLimiter(
        child: GridView.count(
          physics:
              BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          padding: EdgeInsets.all(_w / 60),
          crossAxisCount: columnCount,
          children: List.generate(
            controller.args['companies'].length,
            (int index) {
              return AnimationConfiguration.staggeredGrid(
                position: index,
                duration: Duration(milliseconds: 500),
                columnCount: columnCount,
                child: ScaleAnimation(
                  duration: Duration(milliseconds: 900),
                  curve: Curves.fastLinearToSlowEaseIn,
                  child: FadeInAnimation(
                    child: GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.companyProfile, arguments: {
                          'company': controller.args['companies'][index]
                              ['company']
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                            bottom: _w / 30, left: _w / 80, right: _w / 80),
                        decoration: BoxDecoration(
                          color:
                              Theme.of(context).colorScheme.primary.lighten(45),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 40,
                              spreadRadius: 10,
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: _w,
                              height: _w / 2.4,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 40,
                                    spreadRadius: 10,
                                  ),
                                ],
                                image: DecorationImage(
                                  image: NetworkImage(
                                      controller.args['companies'][index]
                                          ['company']['coverPic']),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.all(_w / 40),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                controller.args['companies']
                                                    [index]['company']['name'],
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .onBackground,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              SizedBox(height: 2),
                                              Text(
                                                controller.args['companies']
                                                    [index]['company']['bio'],
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .onBackground
                                                      .withOpacity(0.8),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Stat(
                                          w: _w / 2.5,
                                          h: _w / 6,
                                          icon: Icon(Icons.verified_user),
                                          title: 'No. of Users',
                                          value: RevenueCountUpAnimation(
                                            endValue: double.parse(
                                                "${controller.args['companies'][index]['company']['_count']['users']}"),
                                            duration:
                                                const Duration(seconds: 3),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Stat(
                                            w: _w / 3.5,
                                            h: _w / 6,
                                            title: 'Admins',
                                            value: Text(
                                              "2",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .onBackground),
                                            ),
                                            icon: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 6.0),
                                              child: Icon(
                                                Icons.admin_panel_settings,
                                              ),
                                            )),
                                        Stat(
                                            w: _w / 3.5,
                                            h: _w / 6,
                                            title: 'Events',
                                            value: Text(
                                              "${controller.args['companies'][index]['company']['_count']['events']}",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .onBackground),
                                            ),
                                            icon: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 6.0),
                                              child: Icon(
                                                Icons.event,
                                              ),
                                            )),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class Stat extends StatelessWidget {
  const Stat({
    super.key,
    required this.w,
    this.bgColor,
    required this.h,
    required this.title,
    required this.value,
    required this.icon,
  });

  final double w;
  final double h;
  final String title;
  final Widget value;
  final Widget icon;
  final Color? bgColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: w,
      height: h,
      padding: EdgeInsets.all(w / 50),
      decoration: BoxDecoration(
        color:
            bgColor ?? Theme.of(context).colorScheme.primary.withOpacity(0.12),
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          icon,
          SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 12,
                  color: Color.fromARGB(255, 144, 144, 144),
                ),
              ),
              value,
            ],
          ),
        ],
      ),
    );
  }
}
