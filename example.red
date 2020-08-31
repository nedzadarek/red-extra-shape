Red [
    author: {Nędza Darek}
    date: 31-Aug-2020/16:24:50+02:00
    license: {
        Free to use.
        Just mention me (point to the gist/github or something).
        No warranties.
    }
]

do %extra_shape.red
do %extra_styles1.red
draw-block: [
    base 200x200 draw [
        extra-shape [ figure starting-point: 0x0 ending-point: 50x50 number-of-sides: 4 ]
    ]
    ;box 1x1 2x2
    base 200x200 draw [
        extra-shape [ figure2 starting-point: 1x2 ending-point: 50x50 number-of-sides: 4 ] 
    ]
    panel [
        base 200x200 draw [
            extra-shape [ figure2 starting-point: 1x2 ending-point: 50x50 number-of-sides: 4 ]
        ] 
    ]
    
    ; regular polygon
    base 500x500 draw [
        ;fill-pen red
        pen blue
        extra-shape [
            regular-polygon starting-point: 0x0 ending-point: 500x500 sides: 36
        ]

    ]
    
    ; colorful box
    base 100x100 draw [
        extra-shape [
            colorful-box starting-point: 0x0 ending-point: 20x20 color: red
        ]
        box 30x30 50x50
        extra-shape [
            colorful-box starting-point: 60x60 ending-point: 80x80 color: blue
        ]
        
    ]
    
]
view extra-shape draw-block
