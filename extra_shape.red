Red [
    author: {Nędza Darek}
    date: 31-Aug-2020/16:24:50+02:00
    license: {
        Free to use.
        Just mention me (point to the gist/github or something).
        No warranties.
    }
]

extra-shape: function [
    draw-block [block!] 
    /local temp-bl extra-shape-block
    /extern draw-shapes
    ][
    unless draw-shapes [draw-shapes: copy [] ]
    
    parse draw-block rule: [ 
        some [
            change ['extra-shape set extra-shape-block block!] (
                temp-bl: copy [push]
                append/only temp-bl copy []
                append last temp-bl (draw-shapes/(extra-shape-block/1) next extra-shape-block) 
                temp-bl ;return it
            )
            | [ahead block! into rule]
            | skip    
        ]
    ]
    
    return compose draw-block
]
