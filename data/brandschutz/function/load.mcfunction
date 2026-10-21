# Wird bei /reload und beim Welt-Start ausgeführt
scoreboard objectives add brandschutz dummy
scoreboard objectives add brandschutz.feuer dummy
scoreboard objectives add brandschutz.alarm dummy
scoreboard objectives add brandschutz.aktiv dummy
scoreboard objectives add brandschutz.phase dummy
scoreboard objectives add brandschutz.manuell dummy
scoreboard objectives add brandschutz.sperre dummy
scoreboard objectives add brandschutz.ton dummy
scoreboard players set #20 brandschutz 20

# Standard-Einstellungen (jeder Wert wird nur gesetzt, wenn er noch fehlt)
#   r          = Erkennungsbereich des Rauchmelders: Quadrat von -r bis +r um den Melder (r:15 -> 31x31 Blöcke)
#   melder_max = Rauchmelder prüfen bis zum Boden, aber höchstens so tief
#   sr         = Löschradius eines Sprinklers
#   st_max     = Sprinkler löschen bis zum Boden, aber höchstens so tief
#                (wird bei Bedarf automatisch in Scheiben gelöscht, kein Blocklimit-Problem)
#   verbindung = alle Sprinkler in diesem Abstand (Kugel) zu einem auslösenden Melder gehen an,
#                auch außerhalb des Raums
#   intervall  = alle wie viele Sekunden ein Melder im Ruhezustand nach Feuer sucht
#                (während eines Alarms prüft er jede Sekunde)
#   probe_radius / probe_dauer = Probealarm: Umkreis um den Spieler / Dauer in Sekunden
#   knopf_radius / knopf_dauer = Feueralarm-Knopf: Umkreis / Dauer in Sekunden
#   ton            = Alarmton aus dem Resourcepack (Sound-ID aus der sounds.json)
#   ton_dauer      = Länge des Tons in Sekunden (so lange spielt kein anderer Melder in der Nähe ihn erneut)
#   ton_abstand    = in diesem Umkreis spielt immer nur ein Melder gleichzeitig den Ton
#   ton_reichweite = Hörweite des Tons in Blöcken
execute unless data storage brandschutz:config ton run data modify storage brandschutz:config ton set value "minecraft:custom.alarm.bma"
execute unless data storage brandschutz:config ton_dauer run data modify storage brandschutz:config ton_dauer set value 65
execute unless data storage brandschutz:config ton_abstand run data modify storage brandschutz:config ton_abstand set value 32
execute unless data storage brandschutz:config ton_reichweite run data modify storage brandschutz:config ton_reichweite set value 48
execute unless data storage brandschutz:config probe_radius run data modify storage brandschutz:config probe_radius set value 100
execute unless data storage brandschutz:config probe_dauer run data modify storage brandschutz:config probe_dauer set value 10
execute unless data storage brandschutz:config knopf_radius run data modify storage brandschutz:config knopf_radius set value 42
execute unless data storage brandschutz:config knopf_dauer run data modify storage brandschutz:config knopf_dauer set value 30
execute unless data storage brandschutz:config intervall run data modify storage brandschutz:config intervall set value 10
execute unless data storage brandschutz:config r run data modify storage brandschutz:config r set value 15
execute unless data storage brandschutz:config melder_max run data modify storage brandschutz:config melder_max set value 64
execute unless data storage brandschutz:config sr run data modify storage brandschutz:config sr set value 10
execute unless data storage brandschutz:config st_max run data modify storage brandschutz:config st_max set value 100
execute unless data storage brandschutz:config verbindung run data modify storage brandschutz:config verbindung set value 24

# Alte Einstellungen aus früheren Versionen aufräumen
data remove storage brandschutz:config tiefe
data remove storage brandschutz:config wand_unten
data remove storage brandschutz:config wand_oben
data remove storage brandschutz:config st

tellraw @a [{text:"[Brandschutz] ",color:"gold"},{text:"geladen. Items: ",color:"gray"},{text:"/function brandschutz:geben",color:"yellow",click_event:{action:"suggest_command",command:"/function brandschutz:geben"}}]
