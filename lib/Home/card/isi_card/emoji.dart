import 'package:flutter/material.dart';
import 'package:flutter_application_notihealth/Home/card/isi_card/hasil_emoji.dart';

const _emojis = ['😡', '😞', '☹️', '😐', '😇', '🥰'];

class emojiPage extends StatefulWidget {
  @override
  _emojiPageState createState() => _emojiPageState();
}

class _emojiPageState extends State<emojiPage> {
  double _value = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffFFA1A1),
      ),
      body: Container(
          decoration: BoxDecoration(
              gradient: new LinearGradient(
                  colors: [Color(0xffFFA1A1), Colors.white],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 24,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(24, 0, 24, 0),
                child: Text(
                  'Tell us about ur\ntoday’s mood',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Container(
                      height: 550,
                      // width: 250,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          // Emoji terendah di kiri
                          RotatedBox(
                            quarterTurns: 3,
                            child: SliderTheme(
                              data: SliderTheme.of(context).copyWith(
                                thumbShape: SliderEmojiThumb(
                                    _emojis[_value.toInt()], 55),
                                trackHeight:
                                    85.0, // Mengatur ketebalan track slider
                              ),
                              child: Slider(
                                value: _value,
                                min: 0.0,
                                max: 5.0,
                                divisions: 5,
                                // label: '${_emojis[_value.toInt()]}',
                                onChanged: (double value) {
                                  // print(_emojis[_value.toInt()]);
                                  setState(() {
                                    _value = value;
                                  });
                                },
                                activeColor: Color(0xffFFA1A1),
                                inactiveColor: Colors.black45,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          width: 150,
                          height: 55,
                          decoration: BoxDecoration(
                              color: Color(0xff801F1F),
                              borderRadius: BorderRadius.circular(15)),
                          child: Center(
                            child: Text(
                              'Cancel',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  hasilEmojiPage(_emojis[_value.toInt()])),
                        ),
                        child: Container(
                          width: 150,
                          height: 55,
                          decoration: BoxDecoration(
                              color: Color(0xff801F1F),
                              borderRadius: BorderRadius.circular(15)),
                          child: Center(
                            child: Text(
                              'Save',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
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
