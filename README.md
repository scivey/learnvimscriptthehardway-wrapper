# learnvimscriptthehardway-wrapper

This wrapper simplifies the process of building/rendering [learnvimscriptthehardway](https://github.com/sjl/learnvimscriptthehardway), which is included as a git subtree along with the build dependency [bookmarkdown](https://github.com/sjl/bookmarkdown).

## building
This is unix. You know this.
```shell
make
````
Rendered pages go to `build/learnvimscriptthehardway/`.

## syncing with upstream
Subtrees are managed with [braid](https://github.com/cristibalan/braid).

```shell
braid update
```

