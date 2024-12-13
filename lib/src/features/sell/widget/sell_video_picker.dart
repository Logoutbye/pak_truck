import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:testt/src/configs/color/color.dart';
import 'package:testt/src/configs/extensions.dart';
import 'package:testt/src/configs/theme/theme_text.dart';
import 'package:testt/src/features/sell/view_model/sell_view_model.dart';
import 'package:video_player/video_player.dart';

Widget buildSellVideoPicker(BuildContext context, String label) {
  final viewModel = Provider.of<SellViewModel>(context, listen: false);

  Future<void> showVideoSourceActionSheet() async {
    showModalBottomSheet(
      context: context,
      showDragHandle: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
      ),
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: Icon(Icons.videocam),
                title: Text('Record a Video'),
                titleTextStyle: Themetext.blackBoldText,
                onTap: () async {
                  Navigator.pop(context); // Close the bottom sheet
                  final picker = ImagePicker();
                  final pickedFile =
                      await picker.pickVideo(source: ImageSource.camera);
                  if (pickedFile != null) {
                    final video = File(pickedFile.path);
                    viewModel.setVideo(video);
                  }
                },
              ),
              ListTile(
                leading: Icon(Icons.video_library),
                title: Text('Choose from Gallery'),
                titleTextStyle: Themetext.blackBoldText,
                onTap: () async {
                  Navigator.pop(context); // Close the bottom sheet
                  final picker = ImagePicker();
                  final pickedFile =
                      await picker.pickVideo(source: ImageSource.gallery);
                  if (pickedFile != null) {
                    final video = File(pickedFile.path);
                    viewModel.setVideo(video);
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: Themetext.headline.copyWith(fontSize: 16),
      ),
      SizedBox(height: context.mediaQueryHeight / 70),
      GestureDetector(
        onTap: showVideoSourceActionSheet,
        child: Consumer<SellViewModel>(
          builder: (_, vm, __) {
            final video = vm.video;
            final videoController = vm.videoController;
            return DottedBorder(
              dashPattern: const <double>[10, 5],
              color: AppColors.primaryColor,
              borderType: BorderType.RRect,
              radius: Radius.circular(12),
              padding: EdgeInsets.all(6),
              child: SizedBox(
                height: context.mediaQueryHeight / 6,
                width: double.infinity,
                child: video != null &&
                        videoController != null &&
                        videoController.value.isInitialized
                    ? Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Container(
                              width: double.infinity,
                              height: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: FittedBox(
                                fit: BoxFit.cover,
                                child: SizedBox(
                                  width: videoController.value.size.width,
                                  height: videoController.value.size.height,
                                  child: VideoPlayer(videoController),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.videocam,
                              color: AppColors.primaryColor, size: 40),
                          SizedBox(height: 8),
                          Text(
                            'Add Video',
                            style: TextStyle(
                                color: AppColors.primaryColor, fontSize: 16),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'MP4, AVI, less than 50MB.',
                            style:
                                TextStyle(color: AppColors.grey, fontSize: 15),
                          ),
                        ],
                      ),
              ),
            );
          },
        ),
      ),
      Consumer<SellViewModel>(
        builder: (_, vm, __) {
          final videoController = vm.videoController;
          if (videoController != null && videoController.value.isInitialized) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                vm.isPlaying
                    ? IconButton(
                        icon: Icon(
                          Icons.stop,
                          color: AppColors.primaryColor,
                        ),
                        onPressed: () {
                          vm.stopVideo();
                        },
                      )
                    : IconButton(
                        icon: Icon(
                          vm.isPlaying ? Icons.pause : Icons.play_arrow,
                          color: AppColors.primaryColor,
                        ),
                        onPressed: () {
                          vm.isPlaying ? vm.pauseVideo() : vm.playVideo();
                        },
                      ),
                IconButton(
                  icon: Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    viewModel.removeVideo();
                  },
                ),
              ],
            );
          }
          return SizedBox.shrink();
        },
      ),
    ],
  );
}
