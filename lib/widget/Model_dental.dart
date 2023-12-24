import 'package:back_end/UpDate/Image_slide.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../UpDate/Knowledge_Link.dart';
import '../UpDate/Knowledge_news.dart';
import '../UpDate/Press_release.dart';
import '../UpDate/Toothache.dart';
import '../UpDate/careteeth.dart';
import '../UpDate/clinic.dart';

class Model_dental extends StatelessWidget {
  const Model_dental({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'D E N T A L  N E W S',
            style: GoogleFonts.k2d(
              fontSize: 50,
              color: const Color(0xFF46026D),
            ),
          ),
          Row(
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return const Detel_clinic();
                      },
                    ),
                  );
                },
                child: Container(
                  margin:
                      EdgeInsets.only(left: width * 0.020, top: height * 0.030),
                  width: width * 0.11,
                  height: height * 0.32,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white60,
                    image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          'https://media.giphy.com/media/hF4rhZ5meQhdgz59yR/giphy.gif'),
                    ),
                    border: Border.all(
                      width: width * 0.001,
                      color: const Color(0xFF46026D),
                    ),
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 260),
                      child: Text(
                        'C L I N I C',
                        style: GoogleFonts.k2d(
                          fontSize: 15,
                          color: const Color(0xff38023d),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return const Knowledge_Link();
                      },
                    ),
                  );
                },
                child: Container(
                  margin:
                      EdgeInsets.only(left: width * 0.020, top: height * 0.030),
                  width: width * 0.11,
                  height: height * 0.32,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: width * 0.001,
                      color: const Color(0xFF46026D),
                    ),
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white60,
                    image: const DecorationImage(
                      fit: BoxFit.contain,
                      image: NetworkImage(
                          'https://media.giphy.com/media/mrkk6ctjilhoKnFH8d/giphy.gif'),
                    ),
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 260),
                      child: Text(
                        'K N O W L E D G E  L I N K',
                        style: GoogleFonts.k2d(
                          fontSize: 15,
                          color: const Color(0xff38023d),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return const Knowledge_news();
                      },
                    ),
                  );
                },
                child: Container(
                  margin:
                      EdgeInsets.only(left: width * 0.020, top: height * 0.030),
                  width: width * 0.11,
                  height: height * 0.32,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      fit: BoxFit.contain,
                      image: NetworkImage(
                          'https://media.giphy.com/media/kDjypgTGS3WLyrE6FL/giphy.gif'),
                    ),
                    border: Border.all(
                      width: width * 0.001,
                      color: const Color(0xFF46026D),
                    ),
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white60,
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 260),
                      child: Text(
                        'K N O W L E D G E  N E W S',
                        style: GoogleFonts.k2d(
                          fontSize: 15,
                          color: const Color(0xff38023d),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return const Press_release();
                      },
                    ),
                  );
                },
                child: Container(
                  margin:
                      EdgeInsets.only(left: width * 0.020, top: height * 0.030),
                  width: width * 0.11,
                  height: height * 0.32,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      fit: BoxFit.contain,
                      image: NetworkImage(
                          'https://media.giphy.com/media/GhfvORJhZ2US7esjhN/giphy.gif'),
                    ),
                    border: Border.all(
                      width: width * 0.001,
                      color: const Color(0xFF46026D),
                    ),
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white60,
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 260),
                      child: Text(
                        'P R E S S   R E L E A S E',
                        style: GoogleFonts.k2d(
                          fontSize: 15,
                          color: const Color(0xff38023d),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return const Toothache();
                      },
                    ),
                  );
                },
                child: Container(
                  margin:
                      EdgeInsets.only(left: width * 0.020, top: height * 0.030),
                  width: width * 0.11,
                  height: height * 0.32,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      fit: BoxFit.contain,
                      // image: NetworkImage(
                      //     'https://media.giphy.com/media/jGjpeApmMPt3fyUSsx/giphy.gif'),
                      image: NetworkImage(
                          'https://media.giphy.com/media/IdlxacnVsxGcFxdyHy/giphy.gif'),
                    ),
                    border: Border.all(
                      width: width * 0.001,
                      color: const Color(0xFF46026D),
                    ),
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white60,
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 260),
                      child: Text(
                        'T O O T H A C H E',
                        style: GoogleFonts.k2d(
                          color: const Color(0xff38023d),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return const Careteeth();
                      },
                    ),
                  );
                },
                child: Container(
                  margin:
                      EdgeInsets.only(left: width * 0.020, top: height * 0.030),
                  width: width * 0.11,
                  height: height * 0.32,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      fit: BoxFit.contain,
                      image: NetworkImage(
                          'https://media.giphy.com/media/Wrm6cp70l4dUCeDKwY/giphy.gif'),
                    ),
                    border: Border.all(
                      width: width * 0.001,
                      color: const Color(0xFF46026D),
                    ),
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white60,
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 260),
                      child: Text(
                        'C A R E  F O R  T E E T H',
                        style: GoogleFonts.k2d(
                          fontSize: 15,
                          color: const Color(0xff38023d),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return const ImageSlide();
                      },
                    ),
                  );
                },
                child: Container(
                  margin:
                      EdgeInsets.only(left: width * 0.020, top: height * 0.030),
                  width: width * 0.11,
                  height: height * 0.32,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white60,
                    image: const DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(
                          'https://media.giphy.com/media/fVEJafSh5s50Sj1Fnb/giphy.gif'),
                    ),
                    border: Border.all(
                      width: width * 0.001,
                      color: const Color(0xFF46026D),
                    ),
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 260),
                      child: Text(
                        'I M A G E  S L I D E',
                        style: GoogleFonts.k2d(
                          fontSize: 15,
                          color: const Color(0xff38023d),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
