# F-Droid Analytics
Downloads all the newest apks in a fdroid [index file](https://f-droid.org/repo/index-v2.json) and generates counts of file names.
This is useful for discovering how many apps use which libraries.


## Usage
First transform the index-v2.json file into newest.csv using `node transform.js`.
Then start a `download.sh` and an `analysis.sh` process.
Summarize the counts using `count.sh`.
The file counts will be in the `count` file.

## 29.08.2024
Some of my findings by manually looking at the `count` file:
```
4458 apps
977 some older (before jetpack compose) material design with xml layouts
352 android compose
249 flutter
43 cordova
5 ionic js
```
