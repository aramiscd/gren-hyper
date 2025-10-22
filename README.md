# gren-hyper

Here is a regular `div`:

    Html.div
        [ Attributes.style "background-color" "yellow"
        , Attributes.style "font-size" "19pt"
        , Events.onClick DoStuff
        ]
        [ Html.p [] [ Html.text "Ein Absatz." ]
        , Html.p [] [ Html.text "Noch ein Absatz." ]
        ]

Here is the same `div` written with [aramiscd/gren-hyper](https://github.com/aramiscd/gren-hyper)

    Hyper.div
        |> Hyper.style "background" "yellow"
        |> Hyper.style "font-size" "19pt"
        |> Hyper.onClick DoStuff
        |> Hyper.children
            [ Hyper.p |> Hyper.children [ Hyper.text "Ein Absatz." ]
            , Hyper.p |> Hyper.children [ Hyper.text "Noch ein Absatz." ]
            ]
        |> Hyper.compile
