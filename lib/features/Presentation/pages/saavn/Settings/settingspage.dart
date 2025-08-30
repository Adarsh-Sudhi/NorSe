// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:norse/features/Presentation/pages/MainHomePage/MainHomePage.dart';
import 'package:norse/features/Presentation/pages/saavn/Settings/ytmusiclogin.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:norse/configs/constants/Spaces.dart';
import 'package:norse/configs/notifier/notifiers.dart';
import 'package:norse/features/Presentation/Blocs/Musicbloc/playerui_bloc/playerui_bloc.dart';

import '../Aboutpage/aboutpage.dart';
import '../subscreens/backupandrestore/backupandrestore.dart';

class Settingpage extends StatefulWidget {
  static const String settingpage = './settingpage';
  const Settingpage({super.key});

  @override
  State<Settingpage> createState() => _SettingpageState();
}

class _SettingpageState extends State<Settingpage> {
  String? dropDownAudiovalue = '96kbps.low';

  bool isconnected = false;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((e) async {
      final headers = await getYtMusicHeaders();
      if (headers['cookie'] == 'null') {
        isconnected = false;
      } else {
        isconnected = true;
      }
      setState(() {});
    });
    BlocProvider.of<PlayeruiBloc>(
      context,
    ).add(const PlayeruiEvent.getplayerui());

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: 15,
          ),
        ),
        title: const Textutil(
          text: 'Settings',
          fontsize: 23,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Spaces.kheight10,
              _buildSectionTitle('Playback'),
              Spaces.kheight10,
              _buildAudioQualitySelector(),
              Spaces.kheight10,
              _buildVideoQualitySelector(),
              Spaces.kheight10,
              BuildhomeSelecter(),
              Spaces.kheight10,
              _buildSectionTitle('General'),
              Spaces.kheight10,
              /* SettingsTileCard(
                title: 'YT Music',
                subtitle: 'Connect with YT account',
                iconData: Ionicons.logo_youtube,
                trailing:
                    !isconnected
                        ? TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => Ytmusiclogin()),
                            );
                          },
                          style: TextButton.styleFrom(
                            maximumSize: Size(80, 40),
                            minimumSize: Size(80, 40),
                            backgroundColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                          child: const Text(
                            "Connect",
                            style: TextStyle(color: Colors.white, fontSize: 13),
                          ),
                        )
                        : TextButton(
                          onPressed: () async {
                            await removeYtMusicHeaders();

                            final headers = await getYtMusicHeaders();
                            log(headers.toString());
                            if (headers['Cookie'] == '') {
                              isconnected = false;
                            } else {
                              isconnected = true;
                            }
                            setState(() {});
                            setState(() {});
                          },
                          style: TextButton.styleFrom(
                            maximumSize: Size(80, 40),
                            minimumSize: Size(80, 40),
                            backgroundColor: Colors.red,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                          child: const Text(
                            "Disconnect",
                            style: TextStyle(color: Colors.white, fontSize: 13),
                          ),
                        ),
                onTap:
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const Aboutpage()),
                    ),
              ),*/
              Spaces.kheight10,
              SettingsTileCard(
                title: 'Backup & Restore',
                subtitle: 'Backup your app data',
                iconData: Icons.backup_outlined,
                onTap:
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const Backupandrestore(),
                      ),
                    ),
              ),

              const SizedBox(height: 10),

              SettingsTileCard(
                title: 'About',
                subtitle: 'Version & Credits',
                iconData: Icons.info_outline_rounded,
                onTap:
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const Aboutpage()),
                    ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAudioQualitySelector() {
    const qualityOptions = ["96kbps.low", "160kbps.medium", "360kbps.high"];

    return BlocBuilder<PlayeruiBloc, PlayeruiState>(
      builder: (context, state) {
        return state.maybeWhen(
          playerui: (ui) {
            String? val = ui['uitype'];

            // ✅ Ensure val exists in the items list, else fallback
            final validValue =
                qualityOptions.contains(val) ? val : qualityOptions.first;

            return SettingsTileCard(
              title: 'Audio Quality',
              subtitle: 'Choose preferred streaming quality',
              iconData: CupertinoIcons.music_note_2,
              trailing: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  dropdownColor: Colors.grey[900],
                  value: validValue,
                  onChanged: (value) {
                    if (value == null) return;
                    setState(() => dropDownAudiovalue = value);
                    Notifiers.qualityNotifier.value = value.split('.')[0];
                    context.read<PlayeruiBloc>().add(
                      PlayeruiEvent.updateui(value),
                    );
                    context.read<PlayeruiBloc>().add(
                      const PlayeruiEvent.getplayerui(),
                    );
                  },
                  items:
                      qualityOptions.map((value) {
                        return DropdownMenuItem(
                          value: value,
                          child: Textutil(
                            text: value,
                            fontsize: 12,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      }).toList(),
                ),
              ),
            );
          },
          orElse: () {
            final validValue =
                qualityOptions.contains(dropDownAudiovalue)
                    ? dropDownAudiovalue
                    : qualityOptions.first;

            return SettingsTileCard(
              title: 'Audio Quality',
              subtitle: 'Choose preferred streaming quality',
              iconData: CupertinoIcons.music_note_2,
              trailing: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  dropdownColor: Colors.grey[900],
                  value: validValue,
                  onChanged: (value) {
                    if (value == null) return;
                    setState(() => dropDownAudiovalue = value);
                    Notifiers.qualityNotifier.value = value.split('.')[0];
                    context.read<PlayeruiBloc>().add(
                      PlayeruiEvent.updateui(value),
                    );
                    context.read<PlayeruiBloc>().add(
                      const PlayeruiEvent.getplayerui(),
                    );
                  },
                  items:
                      qualityOptions.map((value) {
                        return DropdownMenuItem(
                          value: value,
                          child: Textutil(
                            text: value,
                            fontsize: 12,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      }).toList(),
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildVideoQualitySelector() {
    const videoQualityOptions = [
      "low",
      "medium 1080p",
      "medium 1440p",
      "high 4k",
    ]; //['480p', '720p', '1080p', '1440p', '2160p'];

    final validValue =
        videoQualityOptions.contains(Notifiers.videoQualityNotifier.value)
            ? Notifiers.videoQualityNotifier.value
            : videoQualityOptions.first;

    return SettingsTileCard(
      title: 'Video Quality',
      subtitle: 'Choose preferred video streaming quality',
      iconData: CupertinoIcons.video_camera,
      trailing: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          dropdownColor: Colors.grey[900],
          value: validValue,
          onChanged: (value) {
            if (value == null) return;
            setState(() {
              Notifiers.videoQualityNotifier.value = value;
            });
          },
          items:
              videoQualityOptions.map((value) {
                return DropdownMenuItem(
                  value: value,
                  child: Textutil(
                    text: value,
                    fontsize: 12,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                );
              }).toList(),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Textutil(
      text: title,
      fontsize: 16,
      color: Colors.grey.shade400,
      fontWeight: FontWeight.bold,
    );
  }
}

class BuildhomeSelecter extends StatefulWidget {
  const BuildhomeSelecter({super.key});

  @override
  State<BuildhomeSelecter> createState() => _BuildhomeSelecterState();
}

class _BuildhomeSelecterState extends State<BuildhomeSelecter> {
  String? validValue =
      Notifiers.launchdataprovidernotifiers.value == 0 ? 'Saavn' : "YT Music";

  @override
  void initState() {
    super.initState();
    get();
  }

  get() async {
    validValue = await checkplatform();
    if (validValue == "Saavn") {
      Notifiers.launchdataprovidernotifiers.value = 0;
    } else {
      Notifiers.launchdataprovidernotifiers.value = 1;
    }
  }

  _update(String platform) async {
    await MusicPreference.updatePlatform(platform);
  }

  final videoQualityOptions = ["Saavn", "YT Music"];

  @override
  Widget build(BuildContext context) {
    return SettingsTileCard(
      title: 'Launch Data',
      subtitle: 'Choose preferred provider',
      iconData: Ionicons.home,
      trailing: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          dropdownColor: Colors.grey[900],
          value: validValue,
          onChanged: (value) async {
            if (value == 'Saavn') {
              Notifiers.launchdataprovidernotifiers.value = 0;
            } else {
              Notifiers.launchdataprovidernotifiers.value = 1;
            }
            await _update(value == 'Saavn' ? 'Saavn' : 'YT Music');
            await get();

            setState(() {});
          },
          items:
              videoQualityOptions.map((value) {
                return DropdownMenuItem(
                  value: value,
                  child: Textutil(
                    text: value,
                    fontsize: 12,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                );
              }).toList(),
        ),
      ),
    );
  }
}

class MusicPreference {
  static const _keySelectedPlatform = 'selected_platform';

  /// Save selected platform: "saavn" or "ytmusic"
  static Future<void> savePlatform(String platform) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keySelectedPlatform, platform);
  }

  /// Get selected platform: returns "saavn", "ytmusic", or null
  static Future<String?> getPlatform() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keySelectedPlatform);
  }

  /// Update platform (same as save, but named semantically)
  static Future<void> updatePlatform(String newPlatform) async {
    await savePlatform(newPlatform);
  }

  /// Delete the saved platform
  static Future<void> deletePlatform() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_keySelectedPlatform);
  }
}

class SettingsTileCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData iconData;
  final VoidCallback? onTap;
  final Widget? trailing;

  const SettingsTileCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.iconData,
    this.onTap,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.grey.shade900,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.3),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(iconData, color: Colors.white, size: 16),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Textutil(
                    text: title,
                    fontsize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                  const SizedBox(height: 4),
                  Textutil(
                    text: subtitle,
                    fontsize: 11,
                    color: Colors.grey.shade400,
                    fontWeight: FontWeight.normal,
                  ),
                ],
              ),
            ),
            if (trailing != null) trailing!,
          ],
        ),
      ),
    );
  }
}
