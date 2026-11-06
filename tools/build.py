"""Baut die beiden Brandschutz-Packs als ZIP nach dist/.

  dist/Brandschutz-Datapack.zip      pack.mcmeta, README.md, data/
  dist/Brandschutz-Resourcepack.zip  Inhalt von resourcepack/ (Item-Symbole + Alarmton)

Aufruf (im Projektordner):  python tools/build.py
Gibt am Ende die SHA-1 des Resourcepacks aus (für resource-pack-sha1 in server.properties).
"""
import hashlib
import json
import os
import zipfile

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
DIST = os.path.join(ROOT, "dist")


def check_json(folder):
    """Bricht ab, wenn eine JSON-Datei ungültig ist (Minecraft würde sie sonst still ignorieren)."""
    for base, _, files in os.walk(folder):
        for fn in files:
            if fn.endswith((".json", ".mcmeta")):
                with open(os.path.join(base, fn), encoding="utf-8") as f:
                    json.load(f)


def zip_files(dst, entries):
    """entries: Liste (Pfad auf der Platte, Pfad in der ZIP). Minecraft braucht "/" als Trenner."""
    with zipfile.ZipFile(dst, "w", zipfile.ZIP_DEFLATED) as z:
        for src, arc in entries:
            z.write(src, arc.replace(os.sep, "/"))


def walk(folder, prefix=""):
    for base, _, files in os.walk(folder):
        for fn in sorted(files):
            full = os.path.join(base, fn)
            yield full, os.path.join(prefix, os.path.relpath(full, folder))


if __name__ == "__main__":
    os.makedirs(DIST, exist_ok=True)

    check_json(os.path.join(ROOT, "data"))
    datapack = os.path.join(DIST, "Brandschutz-Datapack.zip")
    zip_files(datapack, [(os.path.join(ROOT, "pack.mcmeta"), "pack.mcmeta"),
                         (os.path.join(ROOT, "README.md"), "README.md")]
              + list(walk(os.path.join(ROOT, "data"), "data")))

    rp = os.path.join(ROOT, "resourcepack")
    check_json(rp)
    resourcepack = os.path.join(DIST, "Brandschutz-Resourcepack.zip")
    zip_files(resourcepack, list(walk(rp)))

    for path in (datapack, resourcepack):
        with zipfile.ZipFile(path) as z:
            print("%-32s %3d Dateien" % (os.path.basename(path), len(z.namelist())))
    with open(resourcepack, "rb") as f:
        print("Resourcepack SHA-1:", hashlib.sha1(f.read()).hexdigest())
