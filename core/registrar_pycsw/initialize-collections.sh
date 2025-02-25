#!/usr/bin/env bash


python3 -c "
from registrar.backend import get_backends
from registrar.config import load_config
from registrar_pycsw.backend import PycswItemBackend

config = load_config(open('/config.yaml'))

for backend in get_backends(config):
    if isinstance(backend, PycswItemBackend):
        print('Loading collection metadata')
        backend.load_collection_level_metadata()
"
