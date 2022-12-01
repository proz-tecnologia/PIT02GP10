import 'package:flutter/material.dart';
import 'package:gastos_app/src/core/app_colors.dart';
import '../../core/app_images.dart';
import '../../shared/components/custom_text_field.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool isPasswordVisible = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              AppImages.logoSplash,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 12),
              child: Text(
                'Bem-Vindo!',
                style: TextStyle(
                    color: AppColors.fontColor,
                    fontSize: 36,
                    fontWeight: FontWeight.w700),
              ),
            ),
            CustomTextField(
              label: 'Email',
              filledColor: AppColors.backgroundColor,
            ),
          ],
        ),
      ),
      /* appBar: AppBar(
        backgroundColor: BackgroundColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Image(
            width: 24,
            color: Colors.white,
            //inserir image
          ),
        ),
      ),*/
      /* body: SafeArea(
        child: CustomScrollView(
          reverse: true,
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      fit: FlexFit.loose,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Seja bem-vindo!",
                            style: Headline,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 60,
                          ),
                          MyTextField(
                            hintText: 'Usuário ou e-mail',
                            inputType: TextInputType.text,
                          ),
                          MyPasswordField(
                            isPasswordVisible: isPasswordVisible,
                            onTap: () {
                              setState(() {
                                isPasswordVisible = !isPasswordVisible;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Não possui uma conta?",
                          style: BodyText,
                        ),
                        GestureDetector(
                          child: Text(
                            'Registro',
                            style: BodyText.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    MyTextButton(
                      buttonName: 'Logar',
                      onTap: () {},
                      bgColor: Colors.white,
                      textColor: Colors.black,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),*/
    );
  }
}
