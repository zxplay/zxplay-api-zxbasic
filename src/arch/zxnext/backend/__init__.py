# -*- coding: utf-8 -*-

from src.api.config import OPTIONS
from src.arch.z80 import backend

from src.arch.z80.backend import *

__all__ = [
    "tmp_label",
    "_fpop",
    "HI16",
    "INITS",
    "LO16",
    "LABEL_COUNTER",
    "MEMORY",
    "MEMINITS",
    "QUADS",
    "REQUIRES",
    "TMP_COUNTER",
    "TMP_STORAGES",
    "emit",
    "emit_end",
    "emit_start",
]


# ZXNext asm enabled by default for this arch
OPTIONS.zxnext = True


def init():
    # ZXNext asm enabled by default for this arch
    OPTIONS.zxnext = True

    backend.init()
