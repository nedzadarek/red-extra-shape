Red [
    author: {Nędza Darek}
    date: 31-Aug-2020/16:24:50+02:00
    license: {
        Free to use.
        Just mention me (point to the gist/github or something).
        No warranties.
    }
    other-links: [
        https://www.megamatma.pl/uczniowie/wzory/geometria-analityczna/przeksztalcenia-na-plaszczyznie
        https://www.medianauka.pl/wielokat-foremny
        https://en.wikipedia.org/wiki/Regular_polygon
    ]
]

draw-shapes: #()
draw-shapes/figure: function [var][
        return [
            fill-pen red
            polygon 0x0 50x0 50x50 0x50 0x0 
        ]
]
draw-shapes/figure2: function [var][
        return [
            fill-pen red
            polygon 10x10 150x10 150x150 10x150 10x10 
        ]
]
draw-shapes/regular-polygon: function [var][
    side: function [n R] [
        2 * R * sine (180 / n)
    ]
    angle: function [n][
        (n - 2) / n * 180
    ]
    radius-in: function [side number-of-sides] [
        side / ( 2 * sin (pi / number-of-sides) )
    ]
    rotate: function [point centre angle][
        x': centre/x + ((point/x - centre/x) * cosine angle) - ((point/y - centre/y) * sine angle)
        y': centre/y + ((point/x - centre/x) * sine angle) + ((point/y - centre/y) * cosine angle)
        return reduce['x x' 'y y'] 
    ]
    
    temp-block: copy []
    
    polygon-angle: angle var/sides
    polygon-centre: var/starting-point + ( (var/ending-point - var/starting-point) / 2)
    polygon-radius-out: pick (polygon-centre - var/starting-point) 1
    polygon-number-of-sides: var/sides
    polygon-side-length: to-integer side polygon-number-of-sides polygon-radius-out
    polygon-radius-in: radius-in polygon-side-length polygon-number-of-sides
    
    polygon-line-y: polygon-centre/y + polygon-radius-in
    polygon-line-x: polygon-centre/x - (polygon-side-length / 2)
    polygon-line-start: to-pair reduce [polygon-line-x polygon-line-y]
    
    polygon-line-end: polygon-line-start
    polygon-line-end/x: polygon-line-end/x + polygon-side-length
    
    append temp-block reduce ['polygon polygon-line-start polygon-line-end]

    p1: polygon-line-end
    p2: polygon-line-start
    repeat _ polygon-number-of-sides - 1 [
        p1*: rotate p2 p1 polygon-angle
        append temp-block to-pair reduce [p1*/x p1*/y]
        p2: p1
        p1: p1*
    ]
    return temp-block
]

draw-shapes/colorful-box: function [var][
    temp-bl: copy [fill-pen]
    append temp-bl var/color
    append temp-bl 'box
    append temp-bl var/starting-point
    append temp-bl var/ending-point
]