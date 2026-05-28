#import "@preview/codly:1.3.0": *
#import "@preview/codly-languages:0.1.1": *

#import "@preview/glossarium:0.5.9": make-glossary, register-glossary, print-glossary, gls, glspl

#import "@preview/showybox:2.0.4": showybox

#import "@preview/frame-it:1.2.0": *
#let (notice, definition, guideline) = frames(
  notice: ("Hinweis", red),
  definition: ("Definition"),
  guideline: ("Richtlinie"),
)

#import "@preview/showybox:2.0.4": showybox

#import "@preview/lilaq:0.5.0" as lq

#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#import fletcher.shapes: *

#import "@preview/fancy-tiling:1.0.0": *

#let customref(label) = {
  [(#ref(label, form: "normal"))]
}

#show: codly-init.with()
#codly(languages: codly-languages)
#show: frame-style(styles.boxy)

#set heading(numbering: "1.")
#set math.equation(numbering: "1")

#set figure(gap: 15pt)

= Delaunay-Triangulation

*Grundfrage*: Wie kommen wir von einer Menge an Vertices zu einer Menge an sinnvollen Dreiecken? $arrow$ Triangulierungs-Algorithmen

== Schritte des Bowyer-Watson Algorithmus

1. Erschaffe ein _Super-Triangle_, welches alle Punkte umschließt
2. Füge einen neuen Punkt hinzu
3. Finde alle invaliden Dreiecke, deren Umkreis den neuen Punkt umschließen
4. Erstelle ein Polygon aus allen invaliden Dreiecken
5. Verbinde die Punkte des Polygons mit dem neuen Punkt, um neue Dreiecke zu erschaffen
6. Entferne die invaliden Dreiecke 
7. Wiederhole ab 2. bis alle Punkte eingefügt wurden
8. Entferne alle Dreiecke, die noch mit dem _Super-Triangle_ verwand sind

#showybox()[
*Aufgabe*: Implementiere die Delaunay-Triangulation unter der Nutzung des Bowyer-Watson Algorithmus (Falls andere Ansätze genutzt werden wollen, ist das auch möglich)
]

== Hilfreiche Links 
- #link("https://en.wikipedia.org/wiki/Delaunay_triangulation")[https://en.wikipedia.org/wiki/Delaunay_triangulation]
- #link("https://en.wikipedia.org/wiki/Bowyer%E2%80%93Watson_algorithm")[https://en.wikipedia.org/wiki/Bowyer%E2%80%93Watson_algorithm]
- #link("https://www.gorillasun.de/blog/bowyer-watson-algorithm-for-delaunay-triangulation/")[https://www.gorillasun.de/blog/bowyer-watson-algorithm-for-delaunay-triangulation/]

== Java Projekt
In dem Ordner `OpenGL/lwjgl-project` und in dem Package `java.com.xpromus.tasks` befindet sich das `triangulation` Package.
In diesem Package befinden sich folgende Dateien:
- `TaskMain.java`: Sie führt die Übung mit einer Menge an Punkten, unter der Nutzung von OpenGL aus und sollte bei korrekter Implementierung eine Mesh anzeigen
- `Triangulator.java`: Sie enthält alle Funktionen für die Triangulierung. Die Implementierung wird hier im Laufe der Übung geschehen
Boilerplate-Code und Datentypen wurden bereits implementiert. 
Auch hilfreiche Funktionen, wie zum Beispiel zur Berechnung des Umkreises eines Dreiecks, werden bereitgestellt (zu finden in den Klassen im `data` Package)
Der Fokus liegt hier nur auf der Logik des Algorithmus.

== Zu erwartendes Ergebnis
#figure(
  image("result.png", width: 55%),
  caption: [Ergebnis bei den gegebenen Beispielpunkten]
)
