import 'package:mockito/mockito.dart';
import 'package:pbdl/src/input/sketch/entities/layers/abstract_group_layer.dart';
import 'package:pbdl/src/input/sketch/entities/layers/artboard.dart';
import 'package:pbdl/src/input/sketch/entities/layers/group.dart';
import 'package:pbdl/src/input/sketch/entities/layers/rectangle.dart';
import 'package:pbdl/src/input/sketch/entities/layers/sketch_node.dart';
import 'package:pbdl/src/input/sketch/entities/objects/sketch_rect.dart';
import 'package:pbdl/src/input/sketch/services/positional_cleansing_service.dart';
import 'package:test/test.dart';

class GroupMock extends Mock implements Group {}

class ArtboardMock extends Mock implements Artboard {}

class RectangleMock extends Mock implements Rectangle {}

void main() {
  group('Eliminating Offset Test', () {
    var groupSketchNode, artboard, rec;
    var parentFrame, childFrame;
    PositionalCleansingService service;
    setUp(() {
      service = PositionalCleansingService();

      ///TLC: (100, 100) BRC: (300, 300)
      parentFrame = SketchRect(x: 100, y: 100, width: 200, height: 200);

      ///TLC: (0, 0) BRC: (100, 100)
      childFrame = SketchRect(x: 0, y: 0, width: 100, height: 100);

      rec = RectangleMock();
      when(rec.boundaryRectangle).thenReturn(childFrame);
      var children = <SketchNode>[rec];

      groupSketchNode = GroupMock();
      when(groupSketchNode.children).thenReturn(children);
      when(groupSketchNode.boundaryRectangle).thenReturn(parentFrame);

      artboard = ArtboardMock();
      when(artboard.children).thenReturn(children);
      when(artboard.boundaryRectangle).thenReturn(parentFrame);
    });
    test('Eliminating Artboard Offset Test', () {
      var artboardResult = service.eliminateOffset(artboard);
      var recResult = (artboardResult as AbstractGroupLayer).children[0];
      var frameR = recResult.boundaryRectangle;
      expect(frameR.x, 100);
      expect(frameR.y, 100);
    });

    test('Eliminating Group Offset Test', () {
      var groupResult = service.eliminateOffset(groupSketchNode);
      var recResult = (groupResult as AbstractGroupLayer).children[0];
      var frameR = recResult.boundaryRectangle;
      expect(frameR.x, 100);
      expect(frameR.y, 100);
    });
  });
}
