SELECT tag, count(*) AS count
FROM (
    SELECT DISTINCT data->>'id' AS id_tweets,
           '#' || (jsonb->>'text') AS tag
    FROM tweets_jsonb,
    jsonb_array_elements(
        COALESCE(data->'entities'->'hashtags','[]') ||
        COALESCE(data->'extended_tweet'->'entities'->'hashtags','[]')
    ) AS jsonb
    WHERE data->'entities'->'hashtags' @> '[{"text": "coronavirus"}]'
       OR data->'extended_tweet'->'entities'->'hashtags' @> '[{"text": "coronavirus"}]'
) t
GROUP BY tag
ORDER BY count DESC, tag
LIMIT 1000;
