#!/bin/bash
python3 -u /home/smfl2022/hw/twitter_postgres_indexes/load_tweets_batch.py --db=postgresql://postgres:pass@localhost:7824/postgres --inputs $1
