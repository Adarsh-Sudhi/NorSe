part of 'backup_and_restore_bloc.dart';

@freezed
class BackupAndRestoreEvent with _$BackupAndRestoreEvent {
  const factory BackupAndRestoreEvent.started() = _Started;
  const factory BackupAndRestoreEvent.backup() = _Backup;
  const factory BackupAndRestoreEvent.restore() = _Restore;
}