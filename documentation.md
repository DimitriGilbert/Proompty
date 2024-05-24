## Usage

### Proompty

```
A dumb assistant for organized Proompt inge-near:
	target: Proompty subcommand \
		[one of 'add' 'get' 'list' 'remove' 'set']
Usage :
	Proompty <target>
```

### Proompty add

```
add a new proompt:
	name: proompt name
	--template-file <template-file>: template file for the proompt
	--description <description>: description of the proompt
	--tags <tags>: tags associated with the proompt, repeatable
	--template-content <template-content>: content for the template file
	--set-var <set-var>: name to set a variable for the template, repeatable
	--set-var-value <set-var-value>: value of the corresponding set-var, repeatable
	--prefix-mod|--prefix|--pm <prefix-mod>: add default prefix mod to your proompt, repeatable
	--suffix-mod|--suffix|--sm <suffix-mod>: add default suffix mod to your proompt, repeatable
	--proompts <proompts>: existing proompts to use, repeatable
Usage :
	Proompty add <name> \
		[--template-file <value>] \
		[--description <value>] \
		[--tags <value>] \
		[--template-content <value>] \
		[--set-var <value>] \
		[--set-var-value <value>] \
		[--prefix-mod <value>] \
		[--suffix-mod <value>] \
		[--proompts <value>]
```

### Proompty get

```
get a proompt:
	name: proompt name
	--template-file <template-file>: replace default template file
	-p, --prefix-mod|--prefix|--pm <prefix-mod>: add a mod as prefix, repeatable
	-s, --suffix-mod|--suffix|--sm <suffix-mod>: add a mod as suffix, repeatable
	--append <append>: append something to the prompt, repeatable
	--proompts <proompts>: add a proompt, in a proompt, in a proompt, in a..., repeatable
	--clip|--no-clip: copy to clipboard, on by default (use --no-clip to turn it off)
	--output|--no-output: do you need output, on by default (use --no-output to turn it off)
Usage :
	Proompty get <name> \
		[--template-file <value>] \
		[--prefix-mod <value>] \
		[--suffix-mod <value>] \
		[--append <value>] \
		[--proompts <value>] \
		[--[no-]clip] \
		[--[no-]output]
```

### Proompty list

```
list proompts:
	--prompt-dir <prompt-dir>: base directory for listing
Usage :
	Proompty list \
		[--prompt-dir <value>]
```

### Proompty remove

```
remove a proompt:
	name: proompt name to remove
Usage :
	Proompty remove <name>
```

### Proompty set

```
set default variables values for a proompt:
	proompt-name: variable proompt name
	name: variable name
	value: variable value
Usage :
	Proompty set <proompt-name> <name> <value>
```
