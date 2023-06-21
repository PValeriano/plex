from pathlib import Path
from dotenv import load_dotenv
import os
import logging
logging.getLogger().setLevel(logging.INFO)

load_dotenv()

DOWNLOAD_ROOT = os.environ["PLEX_HOME"]
path = Path(f"{DOWNLOAD_ROOT}/media_directory/downloads")

[
    (x.unlink(missing_ok=True), logging.info(f"Deleting {x}"))
    for x in path.iterdir()
    if x.suffix == ".torrent"
]
