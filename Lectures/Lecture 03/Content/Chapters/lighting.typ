#import "../../Template/definitions.typ": *
#import "../../Template/template.typ": hszg-green, chapter-title-slide, subchapter-title-slide

#chapter-title-slide(section-name: [Beleuchtung])

#slide[
  = Lichtquellen
  #set align(horizon)
  *Eigenschaften*:
  - Position $(x, y, z)$, Richtung und Wellenlänge
  - Intensität $I$
  *Lichtquellenarten*:
  - Ambientes Licht
    - Beleuchtungen von allen Oberflächen gleichmäßig
    - Unabhängig von der Betrachterposition
  - (isotropes) Punktlicht
    - Emittiert Licht in alle Richtungen
    - Intensität in Abhängigkeit einer Abstandsfunktion
    - Hat keine räumliche Ausdehnung
]

#slide[
  = Lichtquellen in Blender
  #set align(horizon)

  *Point*: Omnidirektionaler Lichtpunkt (in alle Richtungen gleiche Lichtmenge), Richtung des Lichs durch Intersection-Line bestimmt \

  *Sun*: Direktionales Licht, simuliert unendlich weit entfernte Lichtquelle, Licht ist parallel mit konstanter Intensität \
  
  *Spot*: emittiert einen kegelförmigen Lichtstrahl von der Spitze des Kegels in eine bestimmte Richtung \
  
  *Area*: simuliert Licht, das von einem Oberflächen-Emitter stammt
]

#subchapter-title-slide(section-name: [Arten von Lichtquellen])

#slide[
  = Ambientes Licht
  #set align(horizon)
  - Gleichmäßige Beleuchtung durch hochdiffuse Lichtquellen
  - Wahl von globalem Modell (modellierung aller Lichtquellen und Interaktionen) oder vereinfachtes Konzept _Ambient Light_
  - Unabhängig von Betrachterposition
]

#slide[
  //TODO: More Infos
  = Punktlicht
  #set align(horizon)
  - Punktlichter emittieren Licht in alle Richtungen
  - Intensität der Beleuchtung ist das Inverse des Quadrats der Entfernung von Quelle und Oberfläche
  - Werden eher eingesetzt aus Effizienz-Gründen, weniger wegen Realismus

  #figure(
    image("../../Images/lights/point_light.png", width: 70%)
  )
]

#slide[
  = Spotlight
  #set align(horizon)
  - Point Lights mit limitierter Richtung
  - Realismus kann erhöht werden durch variierende Intensität entlang des Kegels
  - Kein Licht außerhalb des Kegels, aber harte Verläufe eher unnatürlich

  #figure(
    image("../../Images/lights/spot_light.png", width: 75%)
  )
]

#slide[
  = Distant Light
  #set align(horizon)
  - Lichtquellen, welche weit (unendlich) von der Oberfläche entfernt sind
  - Licht fällt parallel
  - Keine Dämpfung
  - Beispiel: Sonne in Blender

  #figure(
    image("../../Images/lights/sun_light.png", width: 70%)
  )
]

#slide[
  = Area Light
  #set align(horizon)

  #figure(
    image("../../Images/lights/area_light.png")
  )
]

#slide[
  = Area Light
  #set align(horizon)

  #figure(
    image("../../Images/lights/area_light_scene.png", width: 60%)
  )
]

#slide[
  = Beleuchtung zusammengefasst
  #set align(horizon)
  Beleuchtungsmodelle: 
  - *Lokal*: z.B.: Phong-Modell
  - *Global*: Raytracing, Radiosity, Path Tracing
  Begrifflichkeit:
  - *Beleuchtung*: Interaktion von Licht mit Materie
  - *Shading*: Berechnung der Beleuchtung an Vertices und Bestimmung der Farbe
  Drei Arten der Interaktion von Licht mit Materie
  - *Specular*: Reflexion in eine Richtung
  - *Diffuse*: Reflexion in alle Richtungen (Streuung)
  - *Durchsichtigkeit*: Brechung des Lichts
]

#chapter-title-slide(section-name: [Beleuchtungsmodelle])

#slide[
  = Beleuchtungsmodelle
  #set align(horizon)
  - Beleuchtungsstärke $I$ an einem Punkt wird als Summe mehrerer Terme modelliert
    - Mehr Terme ergeben plausiblere Ergebnisse
    - Weniger Terme führen zu effizienteren Berechnungen
  - Phong-Reflexionsmodell wird häufig beim Echtzeitrendering verwendet

  #figure(
    image("../../Images/components_of_lighting.png", fit: "contain"),
    caption: [
      Komponenten der gerenderten Farbe auf einem Modell.
    ]
  )
]

#let phongReflectionModel = [Phong Reflection Model]
#subchapter-title-slide(section-name: phongReflectionModel)

#slide[
  = #phongReflectionModel
  == Übersicht
  #set align(horizon)

  - 1975 von Bui Tuong Phong vorgestellt
  - Simulation von glänzenden Highlights oder hellen Stellen an Objekten mit punktförmigen Lichtquellen
  - Beispiel: Polierte Böden, bemalte Oberflächen, Whiteboards, ...
  - Mehr visuelle Tiefe durch die Reflektion von Licht
  - Lässt Oberflächen *glossy* und *metallic* erscheinen
  - Entwickelt für Oberflächen, die nicht komplett matt sind

  #figure(
    image("../../Images/phong_reflection_components.png", fit: "contain"),
    caption: [
      Bestandteile des Phong-Reflexionsmodells
    ]
  )
]

#slide[
  = #phongReflectionModel
  == Übersicht
  #set align(horizon)

  - Die Highlights passen sich dem Betrachter an
    - Einführung eines neuen Vektors: $accent(V, arrow)$
    - $accent(V, arrow)$ zeigt Richtung Kamera
  - Highlights auf der Oberfläche sind Reflektionen der Lichtquelle
  - Oftmals verschwommene Reflektion durch _Abprallen_ der Lichtstrahlen an der Oberfläche
]

#slide[
  = #phongReflectionModel
  #set align(horizon + center)

  #figure(
    canvas(length: 2cm, {
      import draw: *

      rect((0, 0), (5, 2), stroke: 2.5pt + hszg-green, fill: hszg-green.lighten(90%))

      line((2.5, 2), (1, 4), stroke: 2.5pt + red, mark: (end: ">"), name: "light_vector")
      line((2.5, 2), (2.5, 4), stroke: 2.5pt + red, mark: (end: ">"), name: "surface_normal")
      line((2.5, 2), (4, 4), stroke: 2.5pt + red, mark: (end: ">"), name: "reflection_vector")

      line((2.5, 2), (6, 3), stroke: 2.5pt + red, mark: (end: ">"), name: "view_vector")

      content("light_vector.100%", [$accent(L, arrow)$], padding: (bottom: 25pt))
      content("surface_normal.100%", [$accent(N, arrow)$], padding: (bottom: 25pt))
      content("reflection_vector.100%", [$accent(R, arrow)$], padding: (bottom: 25pt))
      content("view_vector.100%", [$accent(V, arrow)$], padding: (bottom: 25pt, left: 25pt))

      content(("view_vector.100%"), text(size: 50pt)[#emoji.eye], padding: (left: 150pt, bottom: 50pt))
      content(("light_vector.100%"), text(size: 50pt)[#emoji.sun], padding: (right: 100pt, bottom: 155pt))

      content((2.15, 3), [$phi$])
      content((2.85, 3), [$phi$])
      content((4, 3), [$theta$])
    })
  )
]

#slide[
  = #phongReflectionModel
  #set align(horizon)

  $ I_("out") eq I_("ambient") plus I_("diffuse") plus I_("specular") $

  *$I_("ambient")$ Ambiente Komponente:*
  - Unabhängigkeit von Einfallswinkel und Blickwinkel
  - Abhängig von Reflexionsfaktor (Material) und Umgebungslicht

  *$I_("diffuse")$ Diffuse Komponente:*
  - Reflexion in alle Richtungen, unabhängig von Standpunkt
  - Abhängig von Einfallswinkel und diffuser Reflexionsfaktor

  *$I_("specular")$ Spiegelnde Komponente:*
  - Reflexion des Lichts in idealer Richtung
  - Abhängig von Einfallswinkel, Reflexionsfaktor, Oberfläche und Blickrichtung
]

#slide[
  = #phongReflectionModel
  == $I_("ambient")$
  #set align(horizon)
  #grid(
    columns: (1fr),
    [
      #rect(stroke: hszg-green + 2pt, fill: hszg-green.lighten(90%), width: 100%, inset: 15pt)[
        $I_("ambient") eq I_(a) dot k_("ambient")$
      ]
    ], [
      #rect(stroke: hszg-green + 2pt, width: 100%, inset: 15pt)[
        $I_(a)$ ... Intensität des Umgebungslichts \
        $k_("ambient")$ ... Materialkonstante
      ]
    ]
  )
]

#slide[
  = #phongReflectionModel
  == $I_("diffus")$
  #set align(horizon)
  
  #grid(
    columns: (1fr),
    [
      #rect(stroke: hszg-green + 2pt, fill: hszg-green.lighten(90%), width: 100%, inset: 15pt)[
        $I_("diffus") eq I_("in") dot k_("diffus") dot cos(phi)$
      ]
    ], [
      #rect(stroke: hszg-green + 2pt, width: 100%, inset: 15pt)[
        - $I_("in")$ ... Lichtstärke einfallender Lichtstrahl
        - $k_("diffus")$ ... diffuser Reflexionsfaktor
        - #text(fill: red)[*$phi$*] ... Winkel zwischen Normale $accent(N, arrow)$ der Oberfläche und Lichtstrahl $accent(L, arrow)$
      ]
    ]
  )

  #figure(
    canvas({
      import draw: *

      rect((0, 0), (5, 2), stroke: 2pt + hszg-green, fill: hszg-green.lighten(90%))

      line((2.5, 2), (1, 4), stroke: 2pt + red, mark: (end: ">"), name: "light_vector")
      line((2.5, 2), (2.5, 4), stroke: 2pt + red, mark: (end: ">"), name: "surface_normal")
      line((2.5, 2), (4, 4), stroke: 2pt + black, mark: (end: ">"), name: "reflection_vector")

      line((2.5, 2), (6, 3), stroke: 2pt + black, mark: (end: ">"), name: "view_vector")

      content("light_vector.100%", [$accent(L, arrow)$], padding: (bottom: 25pt))
      content("surface_normal.100%", [$accent(N, arrow)$], padding: (bottom: 25pt))
      content("reflection_vector.100%", [$accent(R, arrow)$], padding: (bottom: 25pt))
      content("view_vector.100%", [$accent(V, arrow)$], padding: (bottom: 25pt, left: 25pt))

      content(("view_vector.100%"), text(size: 25pt)[#emoji.eye], padding: (left: 100pt, bottom: 25pt))
      content(("light_vector.100%"), text(size: 25pt)[#emoji.sun], padding: (right: 50pt, bottom: 80pt))

      content((2.15, 3), text(fill: red)[*$phi$*])
      content((2.85, 3), [$phi$])
      content((4, 3), [$theta$])
    })
  )
]

#slide[
  = #phongReflectionModel
  == $I_("specular")$
  #set align(horizon)

  #grid(
    columns: (1fr),
    [
      #rect(stroke: hszg-green + 2pt, fill: hszg-green.lighten(90%), width: 100%, inset: 15pt)[
        $I_("specular") eq I_("in") dot k_("specular") dot cos^(n)(theta)$ 
      ]
    ], [
      #rect(stroke: hszg-green + 2pt, width: 100%, inset: 15pt)[
        - $I_("in")$ ... Lichtstärke einfallender Lichtstrahl
        - $k_("specular")$ ... Reflexionsfaktor für Spiegelung
        - #text(fill: red)[*$theta$*] ... Winkel zwischen Reflexionsrichtung und Blickrichtung
        - n ... Konstante zur Beschreibung von Oberflächenbeschaffenheit
      ]
    ]
  )

  #figure(
    canvas({
      import draw: *

      rect((0, 0), (5, 2), stroke: 2pt + hszg-green, fill: hszg-green.lighten(90%))

      line((2.5, 2), (1, 4), stroke: 2pt + black, mark: (end: ">"), name: "light_vector")
      line((2.5, 2), (2.5, 4), stroke: 2pt + black, mark: (end: ">"), name: "surface_normal")
      line((2.5, 2), (4, 4), stroke: 2pt + red, mark: (end: ">"), name: "reflection_vector")

      line((2.5, 2), (6, 3), stroke: 2pt + red, mark: (end: ">"), name: "view_vector")

      content("light_vector.100%", [$accent(L, arrow)$], padding: (bottom: 25pt))
      content("surface_normal.100%", [$accent(N, arrow)$], padding: (bottom: 25pt))
      content("reflection_vector.100%", [$accent(R, arrow)$], padding: (bottom: 25pt))
      content("view_vector.100%", [$accent(V, arrow)$], padding: (bottom: 25pt, left: 25pt))

      content(("view_vector.100%"), text(size: 25pt)[#emoji.eye], padding: (left: 100pt, bottom: 25pt))
      content(("light_vector.100%"), text(size: 25pt)[#emoji.sun], padding: (right: 50pt, bottom: 80pt))

      content((2.15, 3), [$phi$])
      content((2.85, 3), [$phi$])
      content((4, 3), text(fill: red)[*$theta$*])
    })
  )
]

#slide[
  = #phongReflectionModel
  #set align(horizon)
  - Erweiterung für spiegelnde Komponente: Normalisierungsfaktor
  - Helligkeit soll bei großen Werten $n$ nicht abnehmen
  - sinnvoller Faktor: $f eq frac((n plus 2), 2 dot pi)$
  $ I_("specular") eq I_("in") dot k_("specular") dot f dot cos^(n)(theta) $

  *Gesamtdarstellung* für $I_("out") eq I_("ambient") plus I_("diffuse") + I_("specular")$ \
  #grid(
    columns: (1fr, 1fr),
    align: center,
    inset: 15pt,
    [$accent(L, arrow)$ ... Lichteinfallvektor], [$accent(N, arrow)$ ... Normale der Oberfläche],
    [$accent(R, arrow)$ ... Reflexionsvektor ], [$accent(V, arrow)$ ... Sichtvektor]
  )
  
  $ 
    I_("out") &eq 
      overbrace((I_(a) dot k_("ambient")), I_("ambient")) plus 
      overbrace((I_("in") dot k_("diffuse") dot cos(phi)), I_("diffuse")) plus 
      overbrace((I_("in") dot k_("specular") dot frac(n plus 2, 2 dot pi) dot cos^(n)(theta)), I_("specular")) \
    I_("out") &eq I_(a) dot k_("ambient") plus I_("in") dot [k_("diffuse") dot (accent(L, arrow) accent(N, arrow)) plus k_("specular") dot frac(n plus 2, 2 dot pi) dot (accent(R, arrow) accent(V, arrow))^(n)] 
  $
]

#slide[
  = Beleuchtungsmodelle
  #set align(horizon)
  #set text(size: 15pt)
  Das Phong Beleuchtungsmodell enthält nur:
    - Lichtquellen
    - Materialien am Objektpunkt
    - Bekannt als "Lokales Modell"
  #line(length: 100%)
  Moderne *Physically-Based Rendering (PBR)* Ansätze verwenden verschiedene lokale Beleuchtungs- und Reflexionsmodelle (z.B.: Cook-Torrance)
    - Energieerhaltung: es ist unmöglich, Objekte zu modellieren, bei denen das ausgehende Licht größer ist als das eingehende
    - Das Erscheinungsbild von Metallen ist realistischer
    - Einfaches Festlegen von 3D-Modellen, die in allen Anwendungen gut aussehen (kein Tweaking erforderlich)
    - Verbreitet in modernen Spiel-Engines und 3D Software (Unity, Unreal, Blender ...)
  #line(length: 100%)
  Echte Beleuchtung gehört dazu:
    - Lichtreflexion von einem Objekt auf ein anderes (globales Modell)
    - Zusätzliche Lichtquellen für einen Objektpunkt
    - Transparenz
    - Raytracing, Radiosity-Ansätze
]
