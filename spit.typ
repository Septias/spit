#import "@preview/touying:0.7.4": *
#import "functions.typ": *

#set text(
  font: "einfachBdP",
  size: 24pt,
  weight: "bold",
  fill: blau,
  lang: "de",
)
#set par(leading: .4em)
#set list(
  marker: (
    box(width: 18pt, bullet),
    box(width: 36pt, inset: (left: 18pt), bullet),
  ),
  body-indent: 0pt,
  spacing: .4em + 10pt,
)
// zweite Ebene: 5pt statt 10pt Abstand, wie in der Vorlage
#show list: it => {
  set list(spacing: .4em + 5pt)
  it
}

#show: touying-slides.with(
  config-info(
    title: [Grundkurs 2027],
    subtitle: [Ort, Datum],
  ),
  config-page(
    width: 960pt,
    height: 540pt,
    margin: (x: 73.2pt, top: 150.9pt, bottom: 57.2pt),
  ),
  config-common(slide-fn: slide, new-section-slide-fn: new-section-slide),
  config-colors(primary: blau, secondary: gelb, tertiary: rot),
  config-methods(alert: (self: none, it) => text(fill: rot, it)),
)

= Kursvorstellung <touying:skip>
#title-slide(
  title: [Kursvorstellung],
  subtitle: none,
  picture: image("bilder/gruppe.JPG"),
)

== Hallo & Grüezi
- Wie geht es euch?
- Was geht bei euch?

#hochkant-slide(title: [Zeitplan])[
  // nur die Tabelle: ohne Seitenrand und ohne die doppelte Uhrzeit-Spalte rechts
  #box(width: 410pt, height: 658pt, clip: true, at(
    -69.5pt,
    -89.5pt,
    image("asset/zeitplan.pdf", width: 595.3pt, height: 841.9pt),
  ))
]

== GK Quick-Facts
- Der Grundkurs ist der vorletzte Kurs aus dem BdP-Bildungsprogramm.
- Er ist für Teilnehmende ab 17–18 Jahren gedacht.
- Vier Tracks (Wö, Pfadi, Rover, StaVo) decken alle Stufen ab.
- Der Kurs berechtigt zur Juleica.
- Es gibt immer geiles Essen.
- Das Team ist immer babamäßig (und dieses Jahr ganz besonders).


== Selbstreflexion
- Wichtigste Erkenntnis?
- Davon gab es zu wenig?
- Das muss ich unbedingt wieder machen!
- Das passiert mir nicht nochmal!
- Das sollst du auch ausprobieren!


== Teamreflexion
1. Wir wollen Interesse wecken und dafür begeistern, neue Erfahrungen zu machen.
2. Wir wollen Rückhalt bieten und kritikfähig sein…
3. Wir respektieren, dass wir Individuen mit…
4. Wir akzeptieren, dass Fehler gemacht werden.
5. Wir wollen Hilfe geben und annehmen.
6. Wir wollen hinterfragen und Entscheidungen im Diskurs treffen.
7. Wir wollen einen freundschaftlichen, offenen und vertrauensvollen…
8. Wir können uns aufeinander verlassen. Wir wollen uns unterstützen und motivieren.
…

== Erwartungen
Was sind eure Erwartungen…

- Ans Team?
- An die Küche?
- An die Teilis?
- An die VBTs?


= GKoordination
== Roadmap
#roadmap[
  #treffen[SpinnerInnentreffen]
  *Ziele:* Kursraster besprochen, Stufeneinteilung, Motto, Zeit im Team
  - Überblick verschaffen
  - Beauftragte einteilen
  - Stufeneinteilung
  - Motto

  #treffen[VBT 1]
  *Ziele:* Alle ToDos, Programm, Ämter zugeteilt
  - Zeit in den Stufen
  - KWs festlegen
  - Plenumseinheiten vergeben
  - Protokollaufgaben
  - Kurswerbung
][
  #todos[ToDos bis zum VBT 1][
    - KW-Themen sammeln
    - Protokoll abarbeiten
    - Aufgabenbereiche/Beauftragte
    - Kurswerbung
    - Stufenziele und Inhalte festlegen
    - Stufeneinheiten komplett verteilen
    - Motto wird bis zur Werbefähigkeit weitergeplant
  ]
  #todos[ToDos bis zum VBT 2][
    - Aufgabenbereiche/Beauftragte
    - KWs planen
    - Plenum-Programme so gut, wie es geht, fertig machen
    - Stufeneinheiten fertig planen
    - Protokollaufgaben
    - Beauftragten-ToDos
    - Kurswerbung
  ]
]

== Roadmap
#roadmap[
  #treffen[VBT 2]
  *Ziel:* Alle startklar für den Kurs, keine Unklarheiten
  - Aktueller TN-Stand
  - Tages- und Rundenteamende festlegen
  - Ex-Teamenden-Besuch
  - Zeit in den KWs
  - Zeit in den Plenumseinheiten
  - Zeit in den Stufen
  - Externe Referenten?
  - Kennenlernen mit der Küche

  #meilenstein[Kursteil 1 vom 04.04.–11.04.2026]
  #meilenstein[Kursteil 2 ???]
][
  #todos[ToDos bis zum Kursteil 1][
    - Aufgabenbereiche/Beauftragte
    - Stufeneinheiten: Plakate und Orga
    - KWs: Plakate und Orga
    - Plenum-Programme: Plakate und Orga
    - Protokollaufgaben
    - Verkleidung besorgen
    - Materialorganisation
    - Inhalte Druckdoku hochladen
    - Abend-/Morgenrunden gestalten
  ]
]

== Stufenwünsche
In welcher Stufe seht ihr euch?

== Termine
Zückt eure Kalender!


= Motto

== Motto: Reflexion
- Was hat letztes Jahr gut funktioniert?
- Was hat schlecht funktioniert?
- Was soll das Motto erreichen?
- Soll das Motto auf den Abschlussabend zulaufen?


== Motto: Methodik
- Wie viele Leute sollen verantwortlich sein?
- Wer kann alles mithelfen?
- Wann sollen einzelne Stücke vorbereitet werden?
- In welchen Zeiten kann man das Motto vorantreiben?
- Soll der Song passend sein?


== Mottosuche
- (Stillarbeit 15 Minuten) Jede:r denkt sich 2 Mottos aus.
- Danach Vorstellung in Form von Pantomime
- Gefolgt von:
  - Warum habe ich das Motto gewählt?
  - Wie gut lässt es sich umsetzen?
  - Gibt es dazu eine Geschichte?

= Mottoplanung

== Motto-Wahl
Top oder Flop:
1. …

== Gruppenarbeiten zu
- Wie soll die Geschichte aussehen?
- Was lässt sich als Werbung für den GK machen?
- Was sind gute Attrappen und Verkleidungen?
