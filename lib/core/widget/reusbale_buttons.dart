import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class FullButton extends StatelessWidget {
  final String text;
  final Color color;
  final Color? bgColor;
  final double width;
  final double height;
  final VoidCallback onPressed;
  final VoidCallback? longPressed;
  final double fontSize;

  const FullButton({
    super.key,
    required this.text,
    required this.width,
    required this.height,
    required this.onPressed,
    required this.color,
    this.longPressed,
    this.bgColor,
    this.fontSize = 15,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      onLongPress: longPressed,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: bgColor,
        ),
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.poppins(color: Color(0xffFFFFFF), fontSize: 14, fontWeight: FontWeight.w700)
          ),
        ),
      ),
    );
  }
}

class OutlinButton extends StatelessWidget {
  final String text;
  final Color color;
  final Color bgColor;
  final double width;
  final double height;
  final VoidCallback onPressed;
  final double fontSize;

  const OutlinButton(
      {super.key,
      required this.text,
      required this.width,
      required this.height,
      required this.onPressed,
      required this.color,
      required this.bgColor,
      required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: color)),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: color,
              fontSize: fontSize,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}

class SmallIconButton extends StatelessWidget {
  final Icon icon;
  final Color color;
  final Color highcolor;
  final double? width;
  final double? height;
  final Function()? onPressed;

  const SmallIconButton(
      {super.key,
      this.width,
      required this.icon,
      this.onPressed,
      this.height,
      required this.color,
      required this.highcolor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: highcolor,
      ),
      child: IconButton(
        icon: icon,
        color: color,
        highlightColor: highcolor,
        onPressed: onPressed!,
        iconSize: 21.5,

        //disabledColor: AppColors.grey20,
      ),
    );
  }
}

class OutlinIconButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  final Color bgColor;
  final double width;
  final double height;
  final double size;
  final VoidCallback onPressed;

  const OutlinIconButton(
      {super.key,
      required this.width,
      required this.height,
      required this.onPressed,
      required this.color,
      required this.bgColor,
      required this.icon,
      required this.size});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: color)),
        child: Icon(icon, color: color, size: size),
      ),
    );
  }
}

class ImgButton extends StatelessWidget {
  final String image;
  final Color color;
  final Color bgColor;
  final double width;
  final double height;
  final VoidCallback onPressed;

  const ImgButton(
      {super.key,
      required this.width,
      required this.height,
      required this.onPressed,
      required this.color,
      required this.image,
      required this.bgColor});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: color)),
        child: Center(
          child: Image.asset(
            height: 24,
            width: 24,
            image,
          ),
        ),
      ),
    );
  }
}

class ImgTxtButton extends StatelessWidget {
  final String image;
  final Color color;
  final Color bgColor;
  final double width;
  final double height;
  final VoidCallback onPressed;
  final String text;
  final double fontSize;

  const ImgTxtButton({
    super.key,
    required this.width,
    required this.height,
    required this.onPressed,
    required this.color,
    required this.image,
    required this.bgColor,
    required this.text,
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: color)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              height: 20,
              width: 20,
              image,
            ),
            const Gap(6),
            Text(
              text,
              style: GoogleFonts.poppins(
                color: Color(0xff737380), fontWeight: FontWeight.w400, fontSize: 14
              )
            )
          ],
        ),
      ),
    );
  }
}

class FullIconButton extends StatelessWidget {
  final String text;
  final Color color;
  final Color bgColor;
  final double width;
  final double height;
  final VoidCallback onPressed;
  final VoidCallback? longPressed;
  final double fontSize;
  final IconData icon;

  const FullIconButton({
    super.key,
    required this.text,
    required this.width,
    required this.height,
    required this.onPressed,
    required this.color,
    this.longPressed,
    required this.bgColor,
    this.fontSize = 15,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      onLongPress: longPressed,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: bgColor,
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 15,
                color: color,
              ),
              const Gap(6),
              Text(
                text,
                style: TextStyle(
                  color: color,
                  fontSize: fontSize,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OutlinIconsButton extends StatelessWidget {
  final String text;
  final Color color;
  final Color bgColor;
  final double width;
  final double height;
  final VoidCallback onPressed;
  final double fontSize;
  final IconData icon;

  const OutlinIconsButton(
      {super.key,
      required this.text,
      required this.width,
      required this.height,
      required this.onPressed,
      required this.color,
      required this.bgColor,
      required this.fontSize,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: color)),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 15,
                color: color,
              ),
              const Gap(6),
              Text(
                text,
                style: TextStyle(
                  color: color,
                  fontSize: fontSize,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
