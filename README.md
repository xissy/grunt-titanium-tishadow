# grunt-titanium-tishadow
> A template project with Grunt, Titanium and TiShadow.


## Demo
[http://www.youtube.com/watch?v=c1u92zT-oA4](http://www.youtube.com/watch?v=c1u92zT-oA4)

## Dependencies
 * **Grunt** (~0.4.1)
   * **CoffeeScript** (coffee -> js scripts)
   * **Jade** (jade -> xml views)
   * **LTSS** (ltss -> tss styles)
   * **TiShadow** (deploy, test or execute codes lively)
 * **Titanium** (~3.1.3.GA)
   * **Alloy** (MVC framework)


## Directories
This project uses alloy framework with grunt so usually where you have to manage is `ti/src` folder.

 * **ti** - titanium app project
  * **app** - alloy dist folder
  * **src** - alloy source folder
  * **spec** - test spec dist folder
  * **tests** - test spec source folder
  

## Usage

#### Build
```Shell
$ grunt build
```
#### Run TiShadow and watch
```Shell
$ grunt dev
```
#### Test
```Shell
$ grunt test
```
#### Distribute
```Shell
$ ti build --platform <platform> -T <target> ...
```
