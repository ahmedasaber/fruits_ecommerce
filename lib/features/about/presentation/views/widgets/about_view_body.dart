import 'package:flutter/material.dart';
import 'package:fruits_ecommerce/core/utils/app_colors.dart';
import 'package:fruits_ecommerce/core/utils/app_text_style.dart';

class AboutViewBody extends StatelessWidget {
  const AboutViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('🍎 تطبيق فواكهك هو متجر إلكتروني متخصص في بيع أجود أنواع الفواكه الطازجة والموسمية، تم إنشاؤه ليجعل عملية شراء الفواكه أكثر سهولة وراحة من أي وقتٍ مضى.',style: TextStyles.semiBold13),
            Text('في فواكهك نؤمن بأن الصحة تبدأ من الغذاء، ولذلك نسعى لتوفير منتجات طبيعية عالية الجودة، يتم اختيارها بعناية من أفضل المزارع المحلية والعالمية لضمان النكهة الطازجة والفائدة الغذائية المتكاملة.',style: TextStyles.semiBold13,),
            SizedBox(height: 16,),
            Text('نسعى دائمًا لتقديم تجربة تسوّق مريحة وآمنة لكل عملائنا، من خلال واجهة استخدام بسيطة وسريعة، مع إمكانية تصفح المنتجات بسهولة، وإضافة المفضلة، ومتابعة العروض والتخفيضات بشكل مستمر.',style: TextStyles.semiBold13,),
            SizedBox(height: 16,),
            Text('كما نوفر خدمة توصيل سريعة وآمنة إلى باب منزلك، لضمان وصول الفواكه إليك طازجة كما لو كنت قد اخترتها بنفسك.',style: TextStyles.semiBold13,),
            SizedBox(height: 16,),
            Text('هدفنا أن نكون الوجهة الأولى لعشّاق الفواكه الطازجة في كل مكان، من خلال جودة المنتجات، وسهولة الاستخدام، والثقة التي نبنيها مع كل عملية شراء.',style: TextStyles.semiBold13,),
            SizedBox(height: 16,),
            Text('🌿 فواكهك — صحتك تبدأ من اختيار الأفضل.',style: TextStyles.semiBold13,),
            SizedBox(height: 16,),
            Center(child: Text('By El Za3eemooooooooo',style: TextStyles.semiBold13.copyWith(color: Colors.red),)),
          ],
        ),
      ),
    );
  }
}
