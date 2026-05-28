#import "../../Template/definitions.typ": *
#import "../../Template/template.typ": hszg-green, chapter-title-slide, subchapter-title-slide

#chapter-title-slide(section-name: [Texturen])

#slide[
  = Texturen
  #set align(horizon)

  - Bilder, die auf geomtrische Modellierung projeziert werden
  - Ermöglichen Erhöhung des Realismus in der Szene
    - #text(size: 15pt, weight: "light")[Farbtexturen, Bump Mapping, Environment Mapping, ...]
  
  #figure(
    image("../../Images/model_texture_example.png"),
    caption: [
      Vergleich zwischen einem Modell ohne Texturen und mit Texturen.
    ]
  )
]

#slide[
  = Texturierung
  #set align(horizon)

  - Texturierung: Bilder auf geometrische Objekte _kleben_
    - eine "billige" Methode, um mehr Realismus zu erreichen
    - z.B.: Environment Mapping, Bump Mapping

  #figure(
    image("../../Images/mapping_examples.png"),
    caption: [
      Effekte von Environment- und Bump-Mapping. 
    ]
  )
]

#subchapter-title-slide(section-name: [UV-Mapping])

#slide[
  = UV-Mapping
  #set align(horizon)

  - Jeder Vertex $(x, y, z)$ werden Texturkoordinaten $(u, v)$ zugewiesen
  - $"uv"(0, 0)$ entspricht der unteren linken Ecke
  - $"ub"(1, 1)$ entspricht der oberen rechten Ecke

  #figure(
    image("../../Images/uv_mapping.png"),
    caption: [
      Übertragen der UV Koordinaten auf geometrisches Modell.
    ]
  )
]

#slide[
  = UV-Mapping
  #set align(horizon)

  #figure(
    image("../../Images/uv_mapping_error.png", width: 80%, fit: "contain"),
    caption: [
      Fehler beim UV-Mapping. 
      Durch die falsche Koordinatenzuweisung werden Texturen an den falschen Stellen angezeigt.
    ]
  )
]

#slide[
  = UV-Mapping
  #set align(horizon)

  - Mehrfachzuweisung von $u, v$ auf $x, y, z$ möglich
    - Mapping-Channels zur Überlagerung von Texturen
  - Generische Projektionsfunktionen:
    - Planar: Projektion aus Viewport-Richtung
    - Zylindrisch: Konvertierung von $x, y, z$ in Zylinderkoordination
    - Sphärisch: Konvertierung von $x, y, z$ in Kugelkoordinaten
  
  #figure(
    image("../../Images/uv_mapping_earth.png", fit: "stretch", width: 100%)
  )
]

#slide[
  = Unwrapping
  #set align(horizon)
  - Genertierte Koordinaten meist unnatürlich bzw. unpassend
  - Projektion nach Geometrie anwenden:
    - *UV-Unwrapping* - Definition von Schnittkanten an der Mesh
    - _Aufklappen_ der Geometrie an diesen Kanten

  #figure(
    image("../../Images/uv_unwrapping_example.png", fit: "contain", width: 60%)
  )
]

#subchapter-title-slide(section-name: [Mapping])

#slide[
  = Bump Mapping
  #set align(horizon)

  Simulation von Oberflächenunebenheiten
  - kein hochauflösendes Polygonmodell nötig
  - keine Anpassung der Topologie

  Height Maps:
  - Textur definiert Höhe an jedem Pixel
  - Berechnung der Höhe mit Pixel-Farbe
  - Bestimmung der Beleuchtung

  #figure(
    image("../../Images/bump_mapping_example.png")
  )
]

#slide[
  = Normal Mapping
  #set align(horizon)

  - Direkte Manipulation der Richtung der Oberflächennormalen
    - RGB $arrow$ XZY der Normalen
  - Vorteil: schnell zu berechnen (ähnlich zu Farbtexturierung)
  - Nachteil: Keine Manipulation des Meshes
    - kann zu unnatürlichen Schatten und Kanten führen

  #figure(
    image("../../Images/normal_mapping_example.png")
  )
]

#slide[
  = Environment Mapping
  #set align(horizon)

  - Simulation von spiegelnden Oberflächen durch Textur
  - Vorteil: schnell zu berechnen im Vergleich zu Raytracing
  - Nachteil: Variation der Umwelt nicht bzw. schwer in Spiegelung übertragbar

  #figure(
    image("../../Images/environment_mapping_example.png", fit: "cover", width: 60%)
  )
]

#slide[
  = Light Mapping
  #set align(horizon)

  - Beleuchtung pro Pixel
    - wie Phong-Schattierung (und im Gegensatz zu Gouraud-Schattierung)
    - aber echtzeitfähig
  - Funktioniert, wenn die Beleuchtung in einer Umgebung statisch ist
    - der diffuse Anteil bleibt dann aus jedem Winkel gleich
    - Light Maps können auch bei dynamischer Beleuchtung "on the fly" neu errechnet werden

  #figure(
    image("../../Images/light_mapping_example.png", width: 70%)
  )
]

#slide[
  = Gloss Mapping
  #set align(horizon)

  - Gloss Map: Textur, die Glanzkomponente über die Oberfläche variiert
  - Berechnung pro Pixel:
  $ o eq t_("diff") dot i_("diff") plus t_("gloss") dot i_("spec") $
  - $t_("diff")$ ... RGB diffuse Textur
  - $i_("diff")$ ... interpolierte diffuse Beleuchtung aus Vertices
  - $t_("gloss")$ ... Einzelwert Glossmap
  - $i_("spec")$ ... interpoliert spekulare Farbe aus Vertices

  #figure(
    image("../../Images/gloss_mapping_example.png", width: 60%)
  )
]

#slide[
  = Mip Mapping
  #set align(horizon)

  - Technik, um verschiedene Betrachtungsentfernungen zu realisieren
  - *Magnifikation*: starke Vergrößerung
  - *Minifikation*: starke Verkleinerung bis zu 1 Pixel
  - Problem: Aliasing und Artefakte

  #figure(
    image("../../Images/mip_mapping_example.png", width: 50%)
  )
]

#slide[
  = Mip Mapping
  #set align(horizon)

  - Erstellen einer Bildpyramide
  - Halbe Breite und Höhe bei Aufwärtsbewegung
  - Mittelwert über 4 Pixel zu korrespondierendem Pixel auf höherer Ebene
  - Abhängig vom Umfang der Minifizierung bestimmen, welches Bild geholt werden soll
  - Berechnung von $d$ $arrow$ ergibt zwei Bilder $arrow$ Bilineare Interpolation in jedem

  #figure(
    image("../../Images/mip_mapping_pyramid.png", width: 30%)
  )
]

#slide[
  = Texture Baking
  #set align(horizon)

  - Technik in der 3D-Modellierung, die Texturen mit Beleuchtungsinformationen für 3D-Szenen erzeugt
  - Kann auf andere Modelle übertragen werden

  //TODO: Mehr infos
]
