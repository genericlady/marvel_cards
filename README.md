# Marvel Card Scraper
The title says it all, this is a scraper meant to get all of the
Marvel Cards from a specific year. Currently only one scraper
and parser has been made for 1993 but the pattern is clean so
it's easy to create your own parser for any given year and site.
e.g. `CardParser::Year1994`

The only concern `MarvelScraper` has is the methods of any given CardParser. 
Ideally for this to scale gracefully and mitigate runtime errors use the
Strategy Pattern to enforce an interface.

see an example of the Strategy Pattern here https://github.com/genericlady/musical_performance

important note: This project was built a few years ago and since it's a scraper the site it's scraping may have changed.
The project still exists to serve as an example of coding knowledge.

[License](license.md)
