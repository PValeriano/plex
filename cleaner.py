from pathlib import Path
import os
import logging

DOWNLOAD_ROOT = os.environ["PWD"]
path = Path(f"{DOWNLOAD_ROOT}/aria2-downloads")

[(x.unlink(missing_ok=True),
  logging.info(f"Deleting {x}"))
  for x in path.iterdir() if x.suffix == ".torrent"]