#!/bin/bash
uwsgi --http :8000 --module demo --callable app