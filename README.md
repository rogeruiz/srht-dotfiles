# .files con chezmoi

```
                                                    .          ..               .x+=:.
                            !8F           oec :    @88>  x .d88"               z`    ^%
           ueeu.    u       88'          @88888    %8P    5888R                   .   <k
          @888888ee88r     :88           8"*88%     .     '888R        .u       .@8Ned8"
          *" ^"*8888"     .88F           8b.      .@88u    888R     ud8888.   .@^%8888"
                          :88'          u888888> ''888E`   888R   :888'8888. x88:  `)8b.
                          88F            8888R     888E    888R   d888 '88%" 8888N=*8888
                         .88'            8888P     888E    888R   8888.+"     %8"    R88
                         d8F       .     *888>     888E    888R   8888L        @8Wou 9%
                        .88      .@8c    4888      888&   .888B . '8888c. .+ .888888P`
                        d8F     '%888"   '888      R888"  ^*888%   "88888%   `   ^"F
                       :88        ^*      88R       ""      "%       "YP'
                                          88>
                                          48
                                          '8


                                                 u.      u.    u.
                                      .    ...ue888b   x@88k u@88c.
                                 .udR88N   888R Y888r ^"8888""8888"
                                <888'888k  888R I888>   8888  888R
                                9888 'Y"   888R I888>   8888  888R
                                9888       888R I888>   8888  888R
                                9888      u8888cJ888    8888  888R
                                ?8888u../  "*888*P"    "*88*" 8888"
                                 "8888P'     'Y"         ""   'Y"
                                   "P'



                                                                                       .
                    .uef^"                                                            @88>
                  :d88E                       ..       ..    .     :           u.     %8P
              .   `888E            .u       .@88i    .888: x888  x888.   ...ue888b     .
         .udR88N   888E .z8k    ud8888.    ""%888>  ~`8888~'888X`?888f`  888R Y888r  .@88u
        <888'888k  888E~?888L :888'8888.     '88%     X888  888X '888>   888R I888> ''888E`
        9888 'Y"   888E  888E d888 '88%"   ..dILr~`   X888  888X '888>   888R I888>   888E
        9888       888E  888E 8888.+"     '".-%88b    X888  888X '888>   888R I888>   888E
        9888       888E  888E 8888L        @  '888k   X888  888X '888>  u8888cJ888    888E
        ?8888u../  888E  888E '8888c. .+  8F   8888  "*88%""*88" '888!`  "*888*P"     888&
         "8888P'  m888N= 888>  "88888%   '8    8888    `~    "    `"`      'Y"        R888"
           "P'     `Y"   888     "YP'    '8    888F                                    ""
                        J88"              %k  <88F
                        @%                 "+:*%`
                      :"
```

## Descripción

Este repositorio contiene mis archivos de configuración pa' mi computadoras.
Algunas de mis computadoras son de macOS y otras son de algún sabor de Linux.
Por eso es que yo uso a chezmoi para configura todo mi computadoras de una manera
eficiente.

## La mecánica de las operaciones de chezmoi pa' mi

Para yo mismo, yo le pongo una alias de `cz` a `chezmoi` para hacer corto la
operación de usar la herramienta toda las veces. Como lo uso todo los
días sin mucho frecuencia, lo trato de llamar a la atención aquí.

Tal vez tu también lo puedes encontrar buen uso a las cositas que hago yo pa'
yo. Mis archivos de configuración son únicos a mi miso pero sirven también pa'
todo tipo de estilos mecánicas que necesito para macOS y Linux.

El archivo llamado `.chezmoi.toml.tmpl` se puede usar pa' personalizar la
instalación de la configuración del objetivo del sistema. Mucho de lo que hago
yo aquí es simple pero robusto.

### Edición de los archivos de configuración

Al vez en cuando tengo que edificar los archivos y uso el comando `cz edit
<archivo>`. Por ejemplo:

```bash
# mi archivo pa' ZSH
cz edit ~/.zshrc
# o mi archivo pa' Homebrew
cz edit ~/.local/share/rstrz/Brewfile
```
