import 'package:flutter/material.dart';

const _emojis = ['😡', '😞', '☹️', '😐', '😇', '🥰'];

class hasilEmojiPage extends StatefulWidget {
  @override
  final String emoji;
  // final double size;

  hasilEmojiPage(this.emoji);
  _hasilEmojiPageState createState() => _hasilEmojiPageState();
}

class _hasilEmojiPageState extends State<hasilEmojiPage> {
  double _value = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffFFA1A1),
      ),
      body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: new LinearGradient(
                  colors: [Color(0xffFFA1A1), Colors.white],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 370,
                height: 500,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 25),
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(200),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 35,
                              spreadRadius: 20,
                              offset: Offset(1, 1),
                              color: Color(0xffC59898))
                        ],
                        // gradient: new LinearGradient(
                        //     colors: [Color(0xffFFA1A1), Colors.white],
                        //     begin: Alignment.bottomRight,
                        //     end: Alignment.topLeft),
                      ),
                      child: Center(
                        child: Text(
                          widget.emoji,
                          style: TextStyle(fontSize: 96),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 65,
                    ),
                    Text(
                      'You’re on a good way!\nYour day is going\namazing',
                      style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Keep tracking your mood to know how to\nimprove your mental health.',
                      style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.normal),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        width: 280,
                        height: 55,
                        decoration: BoxDecoration(
                            color: Color(0xff801F1F),
                            borderRadius: BorderRadius.circular(25)),
                        child: Center(
                          child: Text(
                            'Got It',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}

class SliderEmojiThumb extends SliderComponentShape {
  final String emoji;
  final double size;

  SliderEmojiThumb(this.emoji, this.size);

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size(size, size);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    final TextSpan span = new TextSpan(
      style: new TextStyle(
        fontSize: size,
        fontFamily: 'EmojiOne',
      ),
      text: emoji,
    );
    final TextPainter tp = new TextPainter(
      text: span,
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );
    tp.layout();

    context.canvas.save();
    context.canvas.translate(center.dx, center.dy);
    context.canvas.rotate(90 * 3.1415927 / 180); // Rotasi 90 derajat
    context.canvas.translate(-center.dx, -center.dy);
    tp.paint(context.canvas, center - Offset(size / 1.6, size / 2));
    context.canvas.restore();
  }
}
