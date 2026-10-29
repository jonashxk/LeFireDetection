# Brandschutz-Datapack (Minecraft Java 26.3)

Rauchmelder erkennen Feuer und lösen Sprinkler in der Nähe aus. Die Sprinkler sprühen Wasserpartikel und löschen das Feuer.

## Installation
1. Diesen Ordner nach `.minecraft/saves/<Welt>/datapacks/` kopieren.
2. In der Welt `/reload` ausführen.
3. Mit `/function brandschutz:geben` bekommst du 1 Rauchmelder und 4 Sprinkler. Alternativ kannst du sie craften (siehe unten).

## Resourcepack (Item-Symbole)
Die drei Items haben eigene 16×16-Symbole. Sie liegen im **Microduck-Resourcepack** unter `assets/brandschutz/`:
- `items/` und `models/item/`: `rauchmelder`, `sprinkler`, `feueralarm_knopf`
- `textures/item/`: die Texturen, erzeugt aus denselben Pixeldaten wie die Symbole auf der Website

Ohne das Resourcepack zeigen die Items ein Fehlersymbol. Die Geräte selbst funktionieren und sehen trotzdem normal aus, weil sie aus normalen Blöcken bestehen.

## Benutzung
- Rauchmelder und Sprinkler werden wie ein Rahmen **an die Decke** gesetzt, der Feueralarm-Knopf an die Wand.
- **Rauchmelder**: prüft alle 10 Sekunden ein **Quadrat** von 31×31 Blöcken (r = 15, also 15 Blöcke in jede Richtung), von der Decke **bis zum Boden**, höchstens 64 Blöcke tief.
  Während eines Alarms prüft er jede Sekunde.
  Er erkennt jedes Feuer im Bereich, auch Feuer an Wänden, z. B. an einer brennenden Holzwand.
  Den Boden sucht er senkrecht unter sich, siehe „Was zählt als Boden?“.
  Bei Feuer wird die LED rot, der Melder piept und in der Actionbar erscheint „Feueralarm!“.
  Außerdem spielt er den **Alarmton** aus dem Resourcepack, siehe unten.
  - Rechtsklick: Testknopf (nur Piepen)
  - Linksklick: abbauen
- **Sprinkler**: springt an, sobald ein Rauchmelder im Umkreis von 24 Blöcken Alarm gibt. Der Umkreis ist eine Kugel, Sprinkler in Nachbarräumen gehen also mit an.
  Er sprüht Wasser und löscht alles Feuer in 10 Blöcken Radius (Fläche 21×21) **bis zum Boden**, höchstens 100 Blöcke tief.
  Den Boden sucht er senkrecht unter sich, siehe „Was zählt als Boden?“.
  Nach dem letzten Feuer läuft er noch 3 Sekunden nach.
- **Feueralarm-Knopf**: wird **an die Wand** gehängt.
  - Rechtsklick löst alle Rauchmelder im Umkreis von 42 Blöcken für 30 Sekunden aus, und damit auch ihre Sprinkler. Ein erneuter Klick verlängert den Alarm.
  - Nach einem Klick ist der Knopf 2 Sekunden gesperrt.
  - Linksklick: abbauen

## Was zählt als Boden?
Melder und Sprinkler suchen den Boden mit einem Strahl senkrecht nach unten. Er startet in ihrer Mitte.
- **Boden** sind typische volle Blöcke wie Stein, Erde, Holz, Bretter, Beton oder Glas.
  **Stufen und Treppen** zählen ebenfalls als Boden, weil Zwischendecken oft daraus bestehen.
- **Durchgelassen** werden Luft, Feuer, Wasser, Gras und Pflanzen, außerdem alle Teilblöcke:
  Zäune, Mauern, Tore, Glasscheiben, Gitter, Ketten, Laternen, Fackeln, Schilder, Banner, Türen, Falltüren,
  Teppiche, Kerzen, Truhen, Betten, Köpfe, Redstone-Bauteile und Ähnliches.
- Die Liste steht in `data/brandschutz/tags/block/durchlaessig.json`.

## Befehle
| Befehl | Wirkung |
|---|---|
| `/function brandschutz:geben` | 1 Rauchmelder, 4 Sprinkler, 1 Feueralarm-Knopf |
| `/function brandschutz:probealarm` | löst alle Rauchmelder im Umkreis von 100 Blöcken für 10 Sekunden aus, inklusive Sprinkler |
| `/function brandschutz:alarm_aus` | beendet alle Alarme, Sprinkler und den Alarmton im Umkreis von 100 Blöcken. Brennt es wirklich noch, schlägt der Melder bei der nächsten Prüfung erneut Alarm. |

## Alarmton
- Der Ton kommt aus dem Resourcepack: `minecraft:custom.alarm.bma`, also die Datei `assets/minecraft/sounds/custom/alarm/bma.ogg`.
- Er wird beim Auslösen eines Melders **einmal** abgespielt, bei Feuer, Probealarm und Knopf.
- **Einmal pro Bereich:** Läuft der Ton schon bei einem Melder im Umkreis von 32 Blöcken, bleiben weitere Melder stumm.
- Der Ton läuft immer bis zum Ende, also etwa 64 Sekunden. Nur `alarm_aus` bricht ihn ab.
- Man hört ihn 48 Blöcke weit. Spieler, die erst später in die Nähe kommen, hören ihn nicht mehr.
- Spieler ohne das Resourcepack hören keinen Ton, das Piepen bleibt aber.
| `/function brandschutz:deinstallieren` | entfernt alle Geräte und Daten |

## Rezepte
| Gerät | Rezept |
|---|---|
| Rauchmelder | Beobachter in der Mitte, je 1 Quarz oben/unten/links/rechts |
| Sprinkler | Werfer oben, Wassereimer darunter (der leere Eimer bleibt übrig) |
| Feueralarm-Knopf | Redstone oben, Steinknopf darunter |

## Einstellungen
Die Einstellungen stehen in `storage brandschutz:config`, Beispiel:
```
/data modify storage brandschutz:config r set value 20
```
| Schlüssel | Standard | Bedeutung |
|---|---|---|
| `r` | 15 | Erkennungsbereich des Melders: Quadrat von −r bis +r |
| `melder_max` | 64 | maximale Prüftiefe des Melders (sonst bis zum Boden) |
| `sr` | 10 | Löschradius des Sprinklers (Quadrat von −sr bis +sr) |
| `st_max` | 100 | maximale Löschtiefe des Sprinklers (sonst bis zum Boden) |
| `verbindung` | 24 | Reichweite Melder → Sprinkler (Kugel) |
| `intervall` | 10 | Sekunden zwischen zwei Prüfungen im Ruhezustand |
| `probe_radius` | 100 | Umkreis von Probealarm und `alarm_aus` |
| `probe_dauer` | 10 | Dauer des Probealarms in Sekunden |
| `knopf_radius` | 42 | Umkreis des Feueralarm-Knopfs |
| `knopf_dauer` | 30 | Alarmdauer nach Knopfdruck in Sekunden |
| `ton` | `"minecraft:custom.alarm.bma"` | Sound-ID des Alarmtons |
| `ton_dauer` | 65 | Länge des Tons in Sekunden |
| `ton_abstand` | 32 | in diesem Umkreis spielt nur ein Melder gleichzeitig den Ton |
| `ton_reichweite` | 48 | Hörweite des Tons in Blöcken |

`/clone` und `/fill` schaffen höchstens 32768 Blöcke auf einmal. Melder und Sprinkler teilen ihren Bereich deshalb automatisch in Scheiben auf, alle Radien sind also möglich.

## So funktioniert die Erkennung
Jeden Block einzeln mit `execute if block` zu prüfen, wäre bei Tausenden Blöcken pro Melder viel zu langsam.
Deshalb kopiert der Melder mit `clone … filtered #minecraft:fire` nur die Feuerblöcke in einen Puffer ganz oben in der Welt.
Der Befehl liefert die Anzahl der kopierten Blöcke zurück, und danach wird der Puffer sofort wieder geleert.

`/clone` schafft höchstens 32768 Blöcke auf einmal. Deshalb prüft der Melder den Raum in **Scheiben**: Bei `r = 15` ist eine Scheibe bis zu 34 Schichten hoch (bei `r = 30` nur 8).
Bei `r = 15` reicht also fast immer eine Scheibe. Sobald eine Scheibe Feuer enthält, werden die übrigen übersprungen.
Kosten pro Melder: 31·31 = 961 gelesene Blöcke pro Schicht Raumhöhe, alle 10 Sekunden. Ein 5 Blöcke hoher Raum kostet also nur ~4.800.

**Nebenwirkung:** Der Puffer ist so hoch wie eine Scheibe. Bei `r = 15` sind das die obersten 34 Schichten der Welt (Overworld Y 286–319, Nether/End Y 222–255).
Dort kann über einem Melder Feuer verschwinden. Ein Melder, der selbst in dieser Höhe hängt, prüft nicht.
Wenn genau dort Feuer gebaut ist, wird es entfernt. Alles andere bleibt unverändert.

## Deinstallieren
`/function brandschutz:deinstallieren`, danach `/datapack disable "file/Brandschutz-Datapack"`.
