

## Inspiration

WALT HICKEY:

> Mike Tyson is the undisputed king of playing characters who are also Mike Tyson: 
> He’s appeared in seven films credited as himself, most of them since “The Hangover,” 
> putting the former boxer in third place behind two talk show hosts who probably 
> work for scale, Jay Leno and Larry King. [FiveThirtyEight](http://fivethirtyeight.com/features/mike-tyson-is-americas-greatest-actor-as-long-as-the-role-is-mike-tyson/?ex_cid=newsletter-significant-digits)

I was curious to run the data myself, and see if it put actors into an interesting order.

## Usage

1. Download "actor" and "actresses" files from sources below.
2. Fix encoding if necessary
3. Run the `calc.awk` script to collate appearances.

```bash
> awk -f calc.awk data/actors-utf8.list | sort -rn >actors.csv                                                                                         
```


## Sources

Raw files downloaded from:

  * ftp://ftp.funet.fi/pub/mirrors/ftp.imdb.com/pub/
  * ftp://ftp.fu-berlin.de/pub/misc/movies/database/

The file "actors.list.gz" has the values.

To convert to utf8, try:
```bash
iconv -c -f cp1255 -t utf8 actors.list >actors-utf8.list
```
