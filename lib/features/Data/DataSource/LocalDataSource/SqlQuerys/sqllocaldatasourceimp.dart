import 'dart:io';
import 'dart:math';
import 'package:dartz/dartz.dart';
import 'package:norse/features/Data/DataSource/LocalDataSource/SqlQuerys/Sqllocaldatasource.dart';
import 'package:path/path.dart' as p;
import 'package:sqflite/sqflite.dart';
import 'dart:developer' as dev;
import 'package:youtube_explode_dart/youtube_explode_dart.dart';
import '../../../../../configs/Error/Errors.dart';
import '../../../../../configs/constants/Spaces.dart';
import '../../../../Domain/Entity/MusicEntity/SongsDetailsEntity/SongsEntity.dart';
import '../../../Models/MusicModels/usermodel.dart';

class Sqldatasourcerepositoryimp extends Sqldatasourcerepository {
  @override
  Future<Database> intializedatabase() async {
    // Initialize FFI if running on Windows

    // Choose database path
    String path;
    if (Platform.isWindows) {
      path = p.join(Directory.current.path, 'nebula.db');
    } else {
      final dbDir = await getDatabasesPath();
      path = p.join(dbDir, 'nebula.db');
    }

    // SQL Table creation strings
    const settings = '''
    CREATE TABLE settings (
     key INTEGER PRIMARY KEY AUTOINCREMENT,
     id varchar(10),
     uitype varchar(20)
    );
  ''';

    const ui = '''
    CREATE TABLE spotify (
     id int,
     accesstoken TEXT,
     refreshtoken TEXT,
     expireon TEXT,
     isexpired int
    );
  ''';

    const cache = '''
   CREATE TABLE response (
     key INTEGER PRIMARY KEY AUTOINCREMENT,
     id varchar(10),
     json TEXT
    );
  ''';

    const fav = '''
    CREATE TABLE fav (
      key INTEGER PRIMARY KEY AUTOINCREMENT,
      id varchar(150),
      title varchar(150),
      artist varchar(150),
      uri varchar(150)
    );
  ''';

    const recent = '''
    CREATE TABLE recent (
      key INTEGER PRIMARY KEY AUTOINCREMENT,
      id varchar(150),
      title varchar(150),
      artist varchar(150),
      imageurl varchar(150),
      downloadurl varchar(150)
    );
  ''';

    const playlist = '''
    CREATE TABLE playlists (
      key INTEGER PRIMARY KEY AUTOINCREMENT,
      id varchar(50),
      title varchar(150),
      date varchar(150)
    );
  ''';

    const userquery = '''
    CREATE TABLE user (
      key INTEGER PRIMARY KEY AUTOINCREMENT,
      name varchar(150),
      date varchar(150)
     );
  ''';

    const downloads = '''
    CREATE TABLE downloads (
      key INTEGER PRIMARY KEY AUTOINCREMENT,
      id varchar(150),
      title varchar(150),
      artist varchar(150),
      imageurl varchar(150),
      downloadurl varchar(150),
      albumname varchar(150)
    );
  ''';

    const usersearch = '''
    CREATE TABLE usersearch (
      key INTEGER PRIMARY KEY AUTOINCREMENT,
      search varchar(150)
    );
  ''';

    const librarysong = '''
     CREATE TABLE librarysong (
       key INTEGER PRIMARY KEY AUTOINCREMENT,
       id varchar(150),
       name varchar(150),
       image varchar(150),
       artist varchar(150),
       uri varchar(150),
       type varchar(10)
    );
  ''';

    const libraryalbum = '''
     CREATE TABLE libraryalbum (
       key INTEGER PRIMARY KEY AUTOINCREMENT,
       id varchar(150),
       name varchar(150),
       image varchar(150),
       url varchar(150)
    );
  ''';

    const libraryplaylist = '''
     CREATE TABLE libraryplaylist (
       key INTEGER PRIMARY KEY AUTOINCREMENT,
       id varchar(150),
       name varchar(150),
       image varchar(150),
       url varchar(150)
    );
  ''';

    const videoaudiodownload = '''
     CREATE TABLE VideoDownload (
       key INTEGER PRIMARY KEY AUTOINCREMENT,
       id varchar(150),
       name varchar(250),
       author varchar(150),
       videourl varchar(250),
       size varchar(60),
       imageurl varchar(50)
    );
  ''';

    return await openDatabase(
      path,
      version: 2,
      onCreate: (db, version) async {
        await db.execute(settings);
        await db.execute(ui);
        await db.execute(downloads);
        await db.execute(recent);
        await db.execute(fav);
        await db.execute(playlist);
        await db.execute(librarysong);
        await db.execute(libraryalbum);
        await db.execute(libraryplaylist);
        await db.execute(userquery);
        await db.execute(usersearch);
        await db.execute(cache);
        await db.execute(videoaudiodownload);
      },
    );
  }

  @override
  Future<bool> addtodownloads(AlbumElements song) async {
    try {
      final db = await intializedatabase();
      const query = ('''
          INSERT INTO downloads (id,title,artist,imageurl,downloadurl,albumname) VALUES (?,?,?,?,?,?)
       ''');
      const search = ('''
          SELECT * FROM downloads WHERE id = ?;
       ''');
      final exist = await db.rawQuery(search, [song.id]);
      if (exist.isNotEmpty) {
        Spaces.showtoast('Added Already');
        return false;
      } else {
        final id = await db.rawInsert(query, [
          song.id,
          song.name,
          song.Artist,
          song.image,
          song.url,
          song.type,
        ]);
        if (id > 0) {
          Spaces.showtoast('Added to Downloads');
          return true;
        } else {
          return false;
        }
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<Either<Failures, List<Map<String, dynamic>>>>
  QueryDownloaddata() async {
    try {
      final db = await intializedatabase();
      const String query = "SELECT * FROM downloads";
      List<Map<String, dynamic>> data = await db.rawQuery(query);
      if (data.isNotEmpty) {
        return right(data);
      } else {
        return left(const Failures.clientfailure());
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<Either<Failures, bool>> removefromdownloads(String id) async {
    try {
      final db = await intializedatabase();
      int integer = await db.delete(
        'downloads',
        where: 'id = ?',
        whereArgs: [id],
      );
      if (integer != 0) {
        return left(const Failures.clientfailure());
      }
      return right(true);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<Either<Failures, bool>> addtorecent(AlbumElements song) async {
    try {
      final db = await intializedatabase();

      const sear = '''
         SELECT * FROM recent WHERE id = ?;
       ''';
      final existing = await db.rawQuery(sear, [song.id]);
      if (existing.isEmpty) {
        const insertquery = '''
        INSERT INTO recent (id,title,artist,imageurl,downloadurl) VALUES (?,?,?,?,?)
       ''';
        await db.rawInsert(insertquery, [
          song.id,
          song.name,
          song.Artist,
          song.image,
          song.url,
        ]);
        return right(true);
      } else {
        await db.delete('recent', where: 'id = ?', whereArgs: [song.id]);
        const insertquery = '''
        INSERT INTO recent (id,title,artist,imageurl,downloadurl) VALUES (?,?,?,?,?)
       ''';
        await db.rawInsert(insertquery, [
          song.id,
          song.name,
          song.Artist,
          song.image,
          song.url,
        ]);
        return right(true);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<Either<Failures, List<Map<String, dynamic>>>> getallrecent() async {
    try {
      final db = await intializedatabase();
      const query = '''
     SELECT * FROM recent ORDER BY key DESC;
     ''';
      final list = await db.rawQuery(query);
      if (list.isNotEmpty) {
        return right(list);
      } else {
        return left(const Failures.clientfailure());
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<Either<Failures, bool>> removefromRecents(String id) async {
    try {
      final db = await intializedatabase();
      final ef = await db.delete('recent', where: 'id = ?', whereArgs: [id]);
      if (ef != 0) {
        return right(true);
      }
      return left(const Failures.clientfailure());
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<Either<Failures, String>> addtofav(
    AlbumElements song,
    bool isadded,
  ) async {
    try {
      final db = await intializedatabase();
      const serachQuery = '''
      SELECT * FROM fav where id = ?;
      ''';
      const insertquery = '''
      INSERT INTO fav(id,title,artist,uri) VALUES (?,?,?,?);
      ''';
      final existing = await db.rawQuery(serachQuery, [song.id]);
      if (existing.isNotEmpty) {
        await removefromfav(existing[0]['id'].toString());
        return right('removed');
      } else {
        await db.rawQuery(insertquery, [
          song.id,
          song.name,
          song.Artist,
          song.url,
        ]);
        return right('added');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<Either<Failures, bool>> removefromfav(String id) async {
    try {
      final db = await intializedatabase();
      int res = await db.delete('fav', where: 'id = ?', whereArgs: [id]);
      if (res == 0) {
        return left(const Failures.clientfailure());
      }
      return right(true);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<Either<Failures, List<Map<String, dynamic>>>> getallfavs() async {
    try {
      final db = await intializedatabase();
      final favsongs = await db.query('fav');
      if (favsongs.isNotEmpty) {
        return right(favsongs);
      } else {
        return left(const Failures.clientfailure());
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<Either<Failures, List<Map<String, dynamic>>>> updateplaylist(
    String table,
    List<Map<String, dynamic>> newitems,
  ) async {
    try {
      final db = await intializedatabase();
      final items = await db.query(table);
      if (items.isEmpty) {
        throw Exception('items empty');
      } else {
        await db.delete(table);
        for (Map<String, dynamic> item in newitems) {
          await db.insert(table, {
            "id": item['id'],
            "title": item['title'],
            "artist": item['artist'],
            "uri": item['uri'],
          });
        }
        final newlist = await db.query(table);
        if (newlist.isNotEmpty) {
          return right(newlist);
        }
        throw Exception('playlist null');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // ignore: non_constant_identifier_names
  @override
  Future<Either<Failures, bool>> Addtoplaylist(
    String tbname,
    AlbumElements song,
  ) async {
    final db = await intializedatabase();

    String tb = tbname.replaceRange(0, 1, '');

    String table = tb.replaceAll(' ', '');

    String insert = '''
      INSERT INTO $table (id,title,artist,uri) VALUES (?,?,?,?);
    ''';

    final data = await db.query(table, where: 'id = ?', whereArgs: [song.id]);
    if (data.isEmpty) {
      int inserted = await db.rawInsert(insert, [
        song.id,
        song.name,
        song.Artist,
        song.url,
      ]);
      if (inserted != 0) {
        return right(true);
      } else {
        return left(const Failures.clientfailure());
      }
    } else {
      return right(false);
    }
  }

  @override
  Future<Either<Failures, bool>> createplaylist(String playlistname) async {
    try {
      Random random = Random();
      int id = random.nextInt(100000) + 1000;
      Database db = await intializedatabase();
      String date = DateTime.now().toString();
      const insert = '''
           INSERT INTO playlists (id,title,date) VALUES (?,?,?);
        ''';
      int data = await db.rawInsert(insert, [
        id.toString(),
        playlistname,
        date,
      ]);
      if (data != 0) {
        final tb = playlistname.replaceRange(0, 1, '');
        final table = tb.replaceAll(' ', '');
        final db = await intializedatabase();

        String create = '''
      CREATE TABLE $table (
         key INTEGER PRIMARY KEY AUTOINCREMENT,
         id varchar[50],
         title varchar[150],
         artist varchar[150],
         uri varchar[200]
      );
    ''';
        await db.execute(create);
        return right(true);
      }
      return left(const Failures.clientfailure());
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<Either<Failures, bool>> deleteplaylist(
    String playlistid,
    String playlistname,
  ) async {
    try {
      String tb = playlistname.replaceRange(0, 1, '');
      String table = tb.replaceAll(' ', '');
      Database db = await intializedatabase();
      int removed = await db.delete(
        'playlists',
        where: 'id = ?',
        whereArgs: [playlistid],
      );
      if (removed != 0) {
        String del = '''
             DROP TABLE $table;
          ''';
        await db.execute(del);
        return right(true);
      } else {
        return left(const Failures.clientfailure());
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<Either<Failures, List<Map<String, dynamic>>>> getallplaylist() async {
    try {
      Database db = await intializedatabase();
      String selectquery = '''
      SELECT * FROM playlists ORDER BY key DESC;
      ''';
      List<Map<String, dynamic>> allplaylists = await db.rawQuery(selectquery);
      if (allplaylists.isNotEmpty) {
        return right(allplaylists);
      } else {
        return left(const Failures.clientfailure());
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<Either<Failures, List<Map<String, dynamic>>>> getallsongsfromplaylists(
    String playlistid,
  ) async {
    try {
      final tb = playlistid.replaceRange(0, 1, '');
      final table = tb.replaceAll(' ', '');
      Database db = await intializedatabase();
      String query = '''
      SELECT * FROM $table;
    ''';
      List<Map<String, dynamic>> res = await db.rawQuery(query);

      if (res.isNotEmpty) {
        return right(res);
      } else {
        return left(const Failures.clientfailure());
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<Either<Failures, bool>> deletesongfromplaylist(
    String playlistname,
    String songid,
  ) async {
    try {
      final tb = playlistname.replaceRange(0, 1, '');
      final table = tb.replaceAll(' ', '');
      Database db = await intializedatabase();
      int removed = await db.delete(
        table,
        where: 'id = ?',
        whereArgs: [songid],
      );
      if (removed != 0) {
        return right(true);
      } else {
        return left(const Failures.clientfailure());
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<Either<Failures, bool>> updateuserplaylist(
    String playlistname,
    List<Map<String, dynamic>> newform,
  ) async {
    try {
      Database db = await intializedatabase();
      String tb = playlistname.replaceRange(0, 1, '');
      String table = tb.replaceAll(' ', '');
      List<Map<String, dynamic>> getall = await db.query(table);
      if (getall.isEmpty) {
        throw Exception('list empty');
      } else {
        await db.delete(table);
        for (Map<String, dynamic> item in newform) {
          await db.insert(table, {
            'id': item['id'],
            'title': item['title'],
            'artist': item['artist'],
            'uri': item['uri'],
          });
        }
        List<Map<String, dynamic>> newlist = await db.query(table);
        if (newlist.isNotEmpty) {
          return right(true);
        } else {
          return const Left(Failures.clientfailure());
        }
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<Either<Failures, bool>> favsong(String songid) async {
    try {
      Database db = await intializedatabase();
      List<Map<String, dynamic>> allsongs = await db.query('fav');
      bool ispresent = allsongs.any((element) => element['id'] == songid);
      if (ispresent) {
        return right(ispresent);
      }
      return right(false);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<Either<Failures, bool>> clearecentsongs() async {
    try {
      Database db = await intializedatabase();
      int deleted = await db.delete('recent');
      if (deleted != 0) {
        return right(true);
      }
      return left(const Failures.clientfailure());
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<Either<Failures, bool>> cleardownloads() async {
    try {
      Database db = await intializedatabase();
      String query = '''
         DELETE FROM downloads;
    ''';
      await db.execute(query);
      return right(true);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<Either<Failures, String>> addtolibrary(
    String type,
    AlbumElements song,
  ) async {
    try {
      dev.log(song.type);
      dev.log(song.name);
      Database db = await intializedatabase();
      if (type == "song") {
        String insert = '''
            INSERT INTO librarysong (id,name,image,artist,uri,type) VALUES (?,?,?,?,?,?);
          ''';
        String getquery = '''
            SELECT * FROM librarysong;
          ''';
        List<Map<String, Object?>> allsongs = await db.rawQuery(getquery);
        bool alreadyexists = allsongs.any(
          (element) => element['id'] == song.id,
        );
        if (alreadyexists) {
          int item = await db.delete(
            'librarysong',
            where: "id = ?",
            whereArgs: [song.id],
          );
          if (item != 0) {
            return right('song removed');
          }
          return right("Removefailed");
        } else {
          int isnull = await db.rawInsert(insert, [
            song.id,
            song.name,
            song.image,
            song.Artist,
            song.url,
            song.type,
          ]);
          if (isnull == 0) {
            return right('not added');
          }
          return right("added Succesfully");
        }
      } else if (type == "album") {
        Database db = await intializedatabase();
        String insert = '''
          INSERT INTO libraryalbum (id,name,image,url) VALUES (?,?,?,?);
        ''';
        List<Map<String, Object?>> alldata = await db.query('libraryalbum');
        bool isexists = alldata.any((element) => element['id'] == song.id);
        if (isexists) {
          int isdeleted = await db.delete(
            'libraryalbum',
            where: "id=?",
            whereArgs: [song.id],
          );
          if (isdeleted != 0) {
            return right('Removed albu,');
          } else {
            return right("Removed failed");
          }
        } else {
          int isadded = await db.rawInsert(insert, [
            song.id,
            song.name,
            song.image,
            song.url,
          ]);
          if (isadded != 0) {
            return right('Added album');
          }
          return right("Adding failed");
        }
      } else if (type == "playlist") {
        Database db = await intializedatabase();
        String insert = '''
          INSERT INTO libraryplaylist (id,name,image,url) VALUES (?,?,?,?);
        ''';
        List<Map<String, Object?>> alldata = await db.query('libraryplaylist');
        bool isexists = alldata.any((element) => element['id'] == song.id);
        if (isexists) {
          int isdeleted = await db.delete(
            'libraryplaylist',
            where: "id=?",
            whereArgs: [song.id],
          );
          if (isdeleted != 0) {
            return right('Removed playlist,');
          } else {
            return right("Removed failed");
          }
        } else {
          int isadded = await db.rawInsert(insert, [
            song.id,
            song.name,
            song.image,
            song.url,
          ]);
          if (isadded != 0) {
            return right('Added playlist');
          }
          return right("Adding failed");
        }
      } else {
        return left(const Failures.clientfailure());
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<Either<Failures, List<Map<String, dynamic>>>> getlibrarysongs() async {
    try {
      Database db = await intializedatabase();
      String getquery = '''
       SELECT * FROM librarysong ORDER BY key DESC;
      ''';
      List<Map<String, dynamic>> songs = await db.rawQuery(getquery);
      if (songs.isNotEmpty) {
        return right(songs);
      } else {
        return left(const Failures.clientfailure());
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<Either<Failures, bool>> removesongfromlib(String id) async {
    try {
      Database db = await intializedatabase();
      int effectedrow = await db.delete(
        'librarysong',
        where: 'id = ?',
        whereArgs: [id],
      );
      if (effectedrow != 0) {
        return right(true);
      }
      return left(const Failures.clientfailure());
    } catch (e) {
      throw Exception('Library song remove Failed');
    }
  }

  @override
  Future<bool> Checkifpresent(String id) async {
    try {
      Database db = await intializedatabase();
      final data = await db.rawQuery('SELECT * FROM librarysong');
      bool ispresnet = data.any((element) => element['id'] == id);
      return ispresnet;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<Either<Failures, List<Map<String, dynamic>>>>
  getlibraryalbums() async {
    try {
      Database db = await intializedatabase();
      List<Map<String, dynamic>> albums = await db.query('libraryalbum');
      if (albums.isNotEmpty) {
        return right(albums);
      } else {
        return left(const Failures.clientfailure());
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<bool> checkforalbumpresent(String id) async {
    try {
      Database db = await intializedatabase();
      final allalbums = await db.query('libraryalbum');
      bool ispresent = allalbums.any((element) => element['id'] == id);
      if (ispresent) {
        return ispresent;
      }
      return false;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<Either<Failures, List<Map<String, dynamic>>>>
  getlibraryplaylist() async {
    try {
      Database db = await intializedatabase();
      List<Map<String, dynamic>> playlists = await db.rawQuery(
        'SELECT * FROM libraryplaylist ORDER BY key DESC',
      );
      if (playlists.isNotEmpty) {
        return right(playlists);
      }
      return left(const Failures.clientfailure());
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<bool> checkifplaylistpresent(String id) async {
    try {
      Database db = await intializedatabase();
      final data = await db.rawQuery('SELECT * FROM libraryplaylist');
      bool ispresnet = data.any((element) => element['id'] == id);
      return ispresnet;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<bool> userdetails(String mode, Usermodel user) async {
    try {
      Database db = await intializedatabase();
      if (mode == 'initial') {
        int data = await db.insert('user', {
          'name': user.name,
          'date': user.date,
        });

        if (data != 0) {
          return true;
        }
        throw Exception('User insertion Failed');
      } else if (mode == 'update') {
        List<Map<String, dynamic>> res = await db.query('user');

        int isupdated = await db.update(
          'user',
          {'name': user.name, 'date': user.date},
          where: "key = ?",
          whereArgs: [res[0]['key']],
        );

        if (isupdated != 0) {
          return true;
        }
        throw Exception('user update failed');
      }
      throw Exception('Invalid mode');
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> updateplayerui(String type) async {
    try {
      Database db = await intializedatabase();

      await db.update(
        'settings',
        {'uitype': type},
        where: 'id = ?',
        whereArgs: ['0'],
      );
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<Map<String, dynamic>> getuserdetails() async {
    try {
      Database db = await intializedatabase();
      List<Map<String, Object?>> res = await db.query('user');
      if (res.isNotEmpty) {
        return res[0];
      }
      throw Exception('user details failed');
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<Either<bool, List<Map<String, dynamic>>>> getsearchsuggestions(
    String mode,
    String search,
  ) async {
    try {
      Database db = await intializedatabase();
      if (mode == 'insert') {
        List<Map<String, dynamic>> res = await db.query('usersearch');

        bool isfound = res.any((element) => element['search'] == search);

        if (isfound) {
          return left(false);
        } else {
          String insert = '''
         INSERT INTO usersearch (search) VALUES (?);
      ''';

          await db.rawInsert(insert, [search]);

          return left(true);
        }
      } else if (mode == 'get') {
        List<Map<String, dynamic>> res = await db.query('usersearch');
        if (res.isNotEmpty) {
          return right(res);
        } else {
          return left(false);
        }
      } else {
        await db.delete('usersearch', where: "search = ?", whereArgs: [search]);
        return left(true);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<Either<Failures, List<List<Map<String, dynamic>>>>> librarysearchfunc(
    String query,
  ) async {
    List<List<Map<String, dynamic>>> searchresults = [];

    try {
      Database db = await intializedatabase();

      String onfavsongs =
          '''SELECT * FROM librarysong WHERE name LIKE ? COLLATE NOCASE''';
      String onfavalbums =
          '''SELECT * FROM libraryalbum WHERE name LIKE ? COLLATE NOCASE''';
      String onfavplaylist =
          '''SELECT * FROM libraryplaylist WHERE name LIKE ? COLLATE NOCASE''';
      String onrecents =
          '''SELECT * FROM recent WHERE title LIKE ? COLLATE NOCASE''';

      final songs = await db.rawQuery(onfavsongs, ['%$query%']);
      final albums = await db.rawQuery(onfavalbums, ['%$query%']);
      final playlists = await db.rawQuery(onfavplaylist, ['%$query%']);
      final recents = await db.rawQuery(onrecents, ['%$query%']);

      searchresults.add(songs);
      searchresults.add(albums);
      searchresults.add(playlists);
      searchresults.add(recents);

      return right(searchresults);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<Map<String, dynamic>> getplayerui(String uitype) async {
    try {
      Database db = await intializedatabase();

      List<Map<String, Object?>> response = await db.query(
        'settings',
        where: 'id = ?',
        whereArgs: ['0'],
      );

      return response[0];
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> initialplayerui() async {
    try {
      Database db = await intializedatabase();

      List<Map<String, Object?>> response = await db.query('settings');

      if (response.isEmpty) {
        await db.insert('settings', {'id': '0', 'uitype': '96kbps.low'});
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<bool> storeresponse(String jsonString, String type) async {
    try {
      Database database = await intializedatabase();

      int res = await database.insert('response', {
        'id': type,
        'json': jsonString,
      }, conflictAlgorithm: ConflictAlgorithm.replace);

      if (res != 0) {
        return true;
      }
      throw Exception('insertion failed');
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<String> getstoredresponse(String id) async {
    dev.log("response intin");
    try {
      Database db = await intializedatabase();

      List<Map<String, dynamic>> res = await db.query(
        'response',
        where: 'id=?',
        whereArgs: [id],
      );

      if (res.isNotEmpty) {
        return res[0]['json'];
      } else {
        return 'failed';
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<bool> videoAndAudioDownload(
    VideoOnlyStreamInfo videoOnlyStreamInfo,
    AudioOnlyStreamInfo audioOnlyStreamInfo,
    Map<String, dynamic> details,
  ) async {
    try {
      dev.log(details.toString());
      Database db = await intializedatabase();

      final res = await db.query(
        'VideoDownload',
        where: 'id=?',
        whereArgs: [details['id']],
      );

      if (res.isEmpty) {
        int effected = await db.insert('VideoDownload', {
          "id": details['id'],
          "name": details['title'],
          "author": details['author'],
          "videourl": details['url'],
          "size": details['size'],
          "imageurl": details['img'],
        });
        if (effected != 0) {
          return true;
        }
        return false;
      } else {
        Spaces.showtoast('Already Added');
        return false;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<List<Map<String, dynamic>>> getAddedDownloadVideos() async {
    try {
      Database db = await intializedatabase();
      String get = '''
      SELECT * FROM VideoDownload ORDER BY key DESC;
      ''';
      List<Map<String, dynamic>> videos = await db.rawQuery(get);
      if (videos.isEmpty) {
        return [];
      }
      return videos;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<bool> removeFromVideoDownloadTab(String id) async {
    try {
      Database db = await intializedatabase();
      String get = '''
      DELETE FROM VideoDownload WHERE id = ?;
      ''';
      int effected = await db.rawDelete(get, [id]);
      if (effected == 0) {
        throw Exception('VideoDownload Table is Empty');
      }
      return true;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> fetchspotifydata(Map<String, dynamic> spotify) async {
    try {
      Database db = await intializedatabase();

      String accessToken = spotify['atoken'];
      String refreshToken = spotify['rtoken'];
      String exipireon = spotify['expireon'];
      int isexpired = spotify['isexpired'] == true ? 1 : 0;

      List<Map<String, dynamic>> existingItems = await db.query('spotify');

      if (existingItems.isNotEmpty) {
        int updated = await db.update(
          'spotify',
          {
            'accesstoken': accessToken,
            'refreshtoken': refreshToken,
            'expireon': exipireon,
            'isexpired': isexpired,
          },
          where: 'id = ?',
          whereArgs: [existingItems.first['id']],
        );

        dev.log("$updated updated");
      } else {
        dev.log(spotify.toString());

        int effected = await db
            .insert(conflictAlgorithm: ConflictAlgorithm.replace, 'spotify', {
              'id': 1,
              'accesstoken': accessToken,
              'refreshtoken': refreshToken,
              'expireon': exipireon,
              'isexpired': isexpired,
            });

        dev.log("$effected effected");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<List<Map<String, dynamic>>> getSpotifyTokens() async {
    try {
      Database db = await intializedatabase();

      List<Map<String, Object?>> data = await db.query('spotify');

      return data;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> logoutspotify() async {
    try {
      Database db = await intializedatabase();
      int effected = await db.delete('spotify');
      dev.log(effected.toString());
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
