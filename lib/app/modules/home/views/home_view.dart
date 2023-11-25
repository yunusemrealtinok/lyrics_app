import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sakin_lyrics_app/app/modules/home/views/lyrics_card.dart';

import '../controllers/home_controller.dart';
import 'dropdown_button.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Obx(
        () => Center(
          child: Column(
            children: [
              const SizedBox(
                height: 55,
              ),
              DropDownButton(
                items: controller.items,
                selectedValue: controller.selectedValue.value,
                setSelectedValue: controller.setSelectedValue,
              ),
              (controller.artist.value != null)
                  ? SizedBox(
                      height: 650,
                      child: LyricsCard(
                        artistEntity: controller.artist.value!,
                        refreshArtistEntity: controller.refreshArtist,
                      ))
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
