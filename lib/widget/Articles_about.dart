import 'package:flutter/material.dart';

class Articles_about extends StatelessWidget {
  const Articles_about({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(
          top: 50,
        ),
        //margin: const EdgeInsets.symmetric(vertical: 100, horizontal: 90),
        constraints:
            BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
        decoration: BoxDecoration(
          color: const Color(0xB2D6D6D6),
          borderRadius: BorderRadius.circular(58),
        ),
        // margin:
        //     const EdgeInsets.only(top: 20, right: 20, left: 20, bottom: 20),
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          child: const SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'บทความเกี่ยวกับฟัน',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      '>>> ฟันคืออะไร?',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                    '\t\t\t\t\t\t\tฟันเป็นส่วนหนึ่งของระบบกล้ามเนื้อและกระดูกในช่องปาก มันประกอบด้วยชั้นต่าง ๆ ที่ช่วยปกป้องส่วนอื่น ๆ ของช่องปาก เช่น เนื้อเยื่อเงา (pulp) ซึ่งประกอบไปด้วยเส้นประสาทและหลอดเลือดที่ให้พลังงานแก่ฟัน ชั้นนอกสุดของฟันคือเครือญี่ปุ่นเขียว (enamel) ซึ่งเป็นส่วนที่แข็งแกร่งที่สุดของฟัน'),
                Text(
                    '\t\tฟันยังประกอบไปด้วยชั้นสองชั้นคือฟันฟัน (dentin) และชั้นของเนื้อเยื่อเจลที่เรียกว่าเครือดง (cementum) ซึ่งคล้ายกับเนื้อเยื่อที่ปกป้องหน้าดินของพืช'),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      '>>> หน้าที่ของฟัน',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                    '\t\t1. การสับประกอบอาหาร: ฟันทำหน้าที่ในการสับและบดอาหารเพื่อให้สามารถกลืนลงสู่กระเพาะอาหารได้ง่ายขึ้น เมื่ออาหารผ่านไปยังกระเพาะอาหาร การสับประกอบของฟันช่วยให้เอนไซม์สามารถทำงานได้อย่างมีประสิทธิภาพ'),
                Text(
                    '\t\t2. การพูด: ฟันเป็นส่วนสำคัญในกระบวนการพูด เช่น เสียงที่เกิดจากการเหยียดเสียงหรือการชักโครกภายในช่องปากจะสร้างเสียงที่ชัดเจนขึ้นเมื่อสัมผัสกับฟัน'),
                Text(
                    '\t\t3. รอยยิ้ม: ฟันมีบทบาทสำคัญในการสร้างรอยยิ้มที่สวยงามและมั่นใจ เมื่อฟันและเหงือกอยู่ในสภาพดีและสุขภาพดี คุณจะมีรอยยิ้มที่ดูน่ารักและเป็นกำลังใจในการสื่อสารกับผู้คนรอบข้าง'),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      '>>> การดูแลฟัน',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                    '\t\t1. แปรงฟันอย่างสม่ำเสมอ: ควรแปรงฟันอย่างน้อย 2 ครั้งต่อวัน โดยใช้แปรงฟันที่มีขนาดและรูปร่างเหมาะสม และใช้สิทธิ์ในการใช้แปรงฟันใหม่ทุก 3-4 เดือนหรือเมื่อขนแปรงฟันเริ่มสึกหรือสูญเสียประสิทธิภาพ'),
                Text(
                    '\t\t2. ใช้สีหลอดยาง: การใช้สีหลอดยางหลังจากการแปรงฟันช่วยในการล้างความสกปรกและเศษอาหารที่ติดอยู่ระหว่างฟันและระบบเหงือก'),
                Text(
                    '\t\t3. ใช้ยาสีฟันที่มีฟลูออไรด์: ยาสีฟันที่มีฟลูออไรด์ช่วยในการป้องกันฟันเสื่อม และช่วยกระจายฟลูออไรด์ที่ช่วยในการสร้างฟันที่แข็งแรง'),
                Text(
                    '\t\t4. ควบคุมอาหารและเครื่องดื่ม: ลดการบริโภคอาหารและเครื่องดื่มที่มีความหวานสูง และเพิ่มการบริโภคผักผลไม้ที่มีส่วนผสมของเส้นใย เพื่อส่งเสริมสุขภาพฟันและเหงือก'),
                Text(
                    '\t\t5. ตรวจสุขภาพฟันที่ทันเวลา: นอกจากการดูแลเอง ควรนัดพบทันตแพทย์เพื่อตรวจสุขภาพฟันอย่างน้อยปีละ 2 ครั้ง ทันตแพทย์สามารถตรวจจับปัญหาทางช่องปากและรักษาโรคเหงือกหรือฟันเสื่อมได้ในช่วงเริ่มต้นก่อนที่จะกลายเป็นปัญหาร้ายแรงมากขึ้น'),
                SizedBox(
                  height: 10,
                ),
                Text(
                    'การดูแลฟันเป็นสิ่งสำคัญในการรักษาสุขภาพทั่วไป อย่าลืมทำความสะอาดฟันอย่างสม่ำเสมอและปฏิบัติตามคำแนะนำของทันตแพทย์เพื่อให้ฟันคงอยู่ในสภาพดีและมีชีวิตอยู่ในปกติตลอดเวลา'),
              ],
            ),
          ),
        ));
  }
}
