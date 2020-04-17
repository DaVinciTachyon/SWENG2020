import 'package:flutter/material.dart';

import 'save_dialog.dart';

import 'dart:io';
import 'package:path/path.dart' as p;
import 'package:audio_recorder/audio_recorder.dart';

import 'package:path_provider/path_provider.dart';

import 'package:EiSHT/audioRecorder/audio_file_list_tile.dart';
import 'package:permission_handler/permission_handler.dart';

class AudioPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AudioPageState();
}

class AudioPageState extends State<AudioPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Theme.of(context).buttonColor, //change your color here
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          "Audio Journal",
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: AudioScreen(),
    );
  }
}

class AudioScreen extends StatefulWidget {
  @override
  State createState() => AudioScreenState();
}

class AudioScreenState extends State<AudioScreen> {
  String body;
  String time;
  int id;
  int count;
  String date;
  String content;
  //@override
  Recording _recording;
  File defaultAudioFile;

  bool _isRecording = false;
  bool _doQuerySave = false; //Activates save or delete buttons

  String tempFilename = "TempRecording"; //Filename without path or extension

  _showSaveDialog() async {
    // Note: SaveDialog should return a File or null when calling Navigator.pop()
    // Catch this return value and update the state of the ListTile if the File has been renamed
    File newFile = await showDialog(
        context: context,
        builder: (context) => SaveDialog(
              defaultAudioFile: defaultAudioFile,
            ));

    if (newFile != null) {
      String basename = p.basename(newFile.path);
      Scaffold.of(context).showSnackBar(new SnackBar(
        content: new Text("Saved file $basename"),
        duration: Duration(milliseconds: 1400),
      ));

      setState(() {
        //Reset the page, and get rid of the buttons
        _isRecording = false;
        _doQuerySave = false;
      });
    }
  }

  Widget _audioComposer() {
    // .. user input
    return FloatingActionButton(
      // .. save entry
      child: Icon(_isRecording ? Icons.stop : Icons.add),
      backgroundColor: Theme.of(context).primaryColor,
      onPressed: () => {
        if (_isRecording == true) {stopRecording()} else {startRecording()}
      },
    );
  }

  stopRecording() async {
    // Await return of Recording object
    //var recording = await AudioRecorder.stop();
    bool isRecording = await AudioRecorder.isRecording;
    await AudioRecorder.stop();

    //final storage = SharedAudioContext.of(context).storage;
    //Directory docDir = await storage.docDir;
    Directory docDir = await getApplicationDocumentsDirectory();

    setState(() {
      //Tells flutter to rerun the build method
      _isRecording = isRecording;
      _doQuerySave = true;
      defaultAudioFile = File(p.join(docDir.path, this.tempFilename + '.m4a'));
    });
    _showSaveDialog();
  }

  startRecording() async {
    try {
      //final storage = SharedAudioContext.of(context).storage;
      //Directory docDir = await storage.docDir;
      await [
        Permission.storage,
        Permission.microphone,
      ].request();
      Directory docDir = await getApplicationDocumentsDirectory();
      String newFilePath = p.join(docDir.path, this.tempFilename);
      File tempAudioFile = File(newFilePath + '.m4a');
      if (await tempAudioFile.exists()) {
        await tempAudioFile.delete();
      }
      if (await AudioRecorder.hasPermissions) {
        await AudioRecorder.start(
          path: newFilePath,
          audioOutputFormat: AudioOutputFormat.AAC,
        );
        Scaffold.of(context).showSnackBar(new SnackBar(
          content: new Text("Recording."),
          duration: Duration(milliseconds: 1400),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: Color.fromRGBO(0, 0, 0, 0.65),
          elevation: 0,
          behavior: SnackBarBehavior.floating,
        ));
      } else {
        Scaffold.of(context).showSnackBar(
          new SnackBar(
            content: new Text("Error! Audio recorder lacks permissions."),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            backgroundColor: Color.fromRGBO(0, 0, 0, 0.65),
            elevation: 0,
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
      bool isRecording = await AudioRecorder.isRecording;
      setState(() {
        //Tells flutter to rerun the build method
        _recording = new Recording(duration: new Duration(), path: newFilePath);
        _isRecording = isRecording;
        defaultAudioFile = tempAudioFile;
      });
    } catch (e) {
      print(e);
    }
  }

  ListView createFileListView(BuildContext context, AsyncSnapshot snapshot) {
    Directory docDir = snapshot.data;
    //Filter out all m4a files
    // create ListTile for each file
    List<FileSystemEntity> dirFiles = docDir.listSync();

    // Glob audio files that are not the temp file.
    List<FileSystemEntity> m4aFiles = dirFiles
        .where((file) => (file.path.endsWith('.m4a') &&
            file.path.split('/').last != 'TempRecording.m4a'))
        .toList();

    //Glob has a bug!!!
    //final audioFilesGlob = new Glob(p.join(docDir,"*"));
    //print (audioFilesGlob.list());
    //var audioFiles = audioFilesGlob.listSync();
    //print("${audioFiles}");

    List<Widget> audioFileTiles = new List();

    for (FileSystemEntity file in m4aFiles) {
      //String nameroot = pathStr.split('/').last;

      if (file.path.endsWith('.m4a')) {
        audioFileTiles.add(new AudioFileListTile(file: file));
      }
    }

    return ListView(children: audioFileTiles);
  }

  @override
  Widget build(BuildContext context) {
    var futureBuilders = new FutureBuilder(
      future: getApplicationDocumentsDirectory(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print("has error");
          return new Text('Error: ${snapshot.error}');
        } else {
          return createFileListView(context, snapshot);
        }
      },
    );
    return Column(
      children: <Widget>[
        Flexible(
          child: futureBuilders,
        ),
        Container(
          alignment: Alignment(1.0, 1.0),
          padding: EdgeInsets.all(15.0),
          child: _audioComposer(),
        ),
      ],
    );
  }
}
