# Proompty

A dumb assistant for organized Proompt inge-near

Proompty is a command line tool to generate prompt based of template you manage.

Why ? Meeeh, creating prompt sucks, you type and type and type, agaiiiiiinnnn ...

And, "maybe", (emphasis on MAYBE) you might sometimes have a have a decent result... 

And once you have good prompts... how do you manage them, hum ?

a single file ? an Obsidian directory perhaps ?

And what ? Copy pasting ? Seriously ??

Maaan this sucks too ! Weren't AI suppose to fix *that* stupid grind ? ...

Well, follow me in going full circle then and use a CLI tool to generate your prompts and manage your templates and mods !

Who needs AI when you have autocomplete in your terminal !!?

## TL;DR

```bash
# install
curl -s https://raw.githubusercontent.com/DimitriGilbert/Proompty/main/utils/get_Proompty -O;
chmod +x get_Proompty;
./get_Proompty --install;

# generate a proompt
Proompty get <my/proompt/template/path>
  [--prefix-mod|-p <my/proompt/mod/path>]
  [--suffix-mod|-s <my/proompt/mod/path>]
  [--<var name> <var value>] ...
  [--template-file <my/proompt/template/path>]

# add a proompt
Proompty add <my/proompt/template/name>
  [--template-file <my/proompt/template/path>]
  [--description <my description>]
  [--tags <tag1>] [--tags <tag2>]
  [--template-content <my template content>]
  [--set-var <var name> --set-var-value <var value>] ...
```

## Installation

An installation script is provided

```bash
# download the script
curl -s https://raw.githubusercontent.com/DimitriGilbert/Proompty/main/utils/get_Proompty -O;
# make it executable
chmod +x get_Proompty;
# display the help
./get_Proompty --help;
#	-b, --branch|--tag|--install-version <branch>: version to install
#	--install-directory <install-directory>: where to install
#	--install-file <install-file>: rc files to install to, forces install, repeatable
#	-i|--install|--no-install: install in bashrc
#	--remove-installer|--no-remove-installer: remove install script itself
#	aliases: --rm,
#	--ssh|--no-ssh: clone using ssh
#	--zip|--no-zip: install using zip archive, not recommended

# generic install
./get_Proompty --install;
```

## Usage

### Proompty

```bash
A dumb assistant for organized Proompt inge-near:
	target: Proompty subcommand \
		[one of 'add' 'get' 'list' 'remove' 'set']
Usage :
	Proompty <target>
```

### Proompty add

add a new proompt
```bash
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

get a proompt:
```bash
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

list proompts:
```bash
	--prompt-dir <prompt-dir>: base directory for listing
Usage :
	Proompty list \
		[--prompt-dir <value>]
```

### Proompty remove

remove a proompt:
```bash
	name: proompt name to remove
Usage :
	Proompty remove <name>
```

### Proompty set

set default variables values for a proompt:
```bash
	proompt-name: variable proompt name
	name: variable name
	value: variable value
Usage :
	Proompty set <proompt-name> <name> <value>
```


## Demonstration

The following commands have been used to generate the proompts below

### improve a snippet

```bash
Proompty get intro/snippet \
  --suffix concise/short \
  --suffix dev/code/add-line-number \
  --suffix dev/concise/just-diff \
  --suffix ready/help \
  --task "improve code quality" \
  --snippet 'select_random_file() {
  local dir="$1"
  local entries=("$dir"/*)
  local entry

  while true; do
    entry="${entries[RANDOM % ${#entries[@]}]}"
    if [ -d "$entry" ]; then
      entries=("$entry"/*)
    elif [ -f "$entry" ]; then
      echo "$entry"
      return
    fi
  done
}'
```
outputs : 
```
I need some help with this code snippet
select_random_file() {
  local dir="$1"
  local entries=("$dir"/*)
  local entry

  while true; do
    entry="${entries[RANDOM % ${#entries[@]}]}"
    if [ -d "$entry" ]; then
      entries=("$entry"/*)
    elif [ -f "$entry" ]; then
      echo "$entry"
      return
    fi
  done
}
Could you help me improve code quality ?
keep your responses short please.
please add the line numbers in the code output.
No need to give me the full code, I just want the modifications.
Are you ready to help me ?
```
what chatGPT told me :
![chatgpt response](content/chatgpt_response.png)

### improvement this time ?

```bash
Proompty get intro/snippet \
  --suffix concise
  --suffix dev/code/add-line-number \
  --suffix dev/concise/just-diff \
  --task "improve code quality" \
  --snippet 'select_random_file() {
  local dir="$1"
  local entries=("$dir"/*)
  local entry

  while true; do
    entry="${entries[RANDOM % ${#entries[@]}]}"
    if [ -d "$entry" ]; then
      entries=("$entry"/*)
    elif [ -f "$entry" ]; then
      echo "$entry"
      return
    fi
  done
}' \
  --suffix dev/code/security
  --suffix dev/praise
```
outputs :
```
I need some help with this code snippet
select_random_file() {
  local dir="$1"
  local entries=("$dir"/*)
  local entry

  while true; do
    entry="${entries[RANDOM % ${#entries[@]}]}"
    if [ -d "$entry" ]; then
      entries=("$entry"/*)
    elif [ -f "$entry" ]; then
      echo "$entry"
      return
    fi
  done
}
Could you help me improve code quality ?
It is very important that you keep the output quantity as low as possible.
Include only necessary information.
I will ask if I need more.
No need to give me the full code, I just want the modifications.
our software security is extremely important ! 
the highest security standards are required from you !
You are a great developer !
```
what chatGPT told me :
![chatgpt response](content/chatgpt_response_2.png) 
...yup !

### less input, more output !

```bash
./Proompty get dev/starter-project \
  --lang bash \
  --project "A simple TODO CLI app called Xitask. It stores tasks lists in Xit format, you can create a list, add remove and cross tasks; each list is a new Xit file." \
  --append "$(./Proompty get use/code/library \
    --library_name parseArger \
    --library_repo "https://github.com/DimitriGilbert/parseArger" \
    --no-clip \
  )"
```
outputs :
```
I have a bash project I am working on and I require some assistance. This is a simple description of my project:
A simple TODO CLI app called Xitask. It stores tasks lists in Xit format, you can create a list, add remove and cross tasks; each list is a new Xit file.
Word out is you are fantastic at doing what we want to do ! So I expect the code quality to be fantastic/10, ok ?
I know I can count on you !
security is our upmost priority !
please make sure the provided code meets the highest security standards !
please add the line numbers in the code output.
It is very important that you keep the output quantity as low as possible.
Include only necessary information.
I will ask if I need more.
please use parseArger for the next task.
you can find parseArger repository at this url https://github.com/DimitriGilbert/parseArger.
make sure that you know where to find the documentation and most importantly, use it !
```
After which chatGPT completely hallucinated [this](https://chatgpt.com/share/3f354cf4-4873-4798-90ae-5de294e16978)... I tried helping him though... but miserably failed XD.

You're proompt are only as good as you apparently :P
