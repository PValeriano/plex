from pathlib import Path
import os
import logging

path = Path(f"{os.environ["PWD"]}/aria2-downloads")
[(x.unlink(missing_ok=True),
  logging.info(f"Deleting {x}"))
  for x in path.iterdir() if x.suffix == ".torrent"]