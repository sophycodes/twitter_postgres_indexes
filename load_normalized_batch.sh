#!/bin/bash
python3 -u load_tweets_batch.py --db=postgresql://postgres:pass@localhost:7824/postgres --inputs $1
