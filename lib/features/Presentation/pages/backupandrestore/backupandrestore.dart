import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:norse/features/Presentation/Blocs/Musicbloc/backupandrestorebloc/bloc/backup_and_restore_bloc.dart';
import '../../../../../../configs/constants/Spaces.dart';

class Backupandrestore extends StatelessWidget {
  static const String backupandrestore = './backuprestore';
  const Backupandrestore({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 18),
        ),
        title: const Textutil(
          text: 'Backup & Restore',
          fontsize: 23,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            children: [
              const SizedBox(height: 20),
              SettingActionTile(
                title: 'Backup Data',
                subtitle: 'Save your data to the Documents folder',
                iconData: Icons.backup_outlined,
                onTap: () {
                  BlocProvider.of<BackupAndRestoreBloc>(
                    context,
                  ).add(const BackupAndRestoreEvent.backup());
                },
              ),
              const SizedBox(height: 15),
              SettingActionTile(
                title: 'Restore Data',
                subtitle: 'Restore from the Documents folder',
                iconData: Icons.restore_outlined,
                onTap: () {
                  BlocProvider.of<BackupAndRestoreBloc>(
                    context,
                  ).add(const BackupAndRestoreEvent.restore());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SettingActionTile extends StatelessWidget {
  const SettingActionTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.iconData,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final IconData iconData;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white.withOpacity(0.05),
      borderRadius: BorderRadius.circular(14),
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
          child: Row(
            children: [
              Icon(iconData, color: Colors.white, size: 24),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Textutil(
                      text: title,
                      fontsize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                    const SizedBox(height: 4),
                    Textutil(
                      text: subtitle,
                      fontsize: 11,
                      color: Colors.white.withOpacity(0.6),
                      fontWeight: FontWeight.normal,
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios_rounded,
                color: Colors.white30,
                size: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
