# gren-hyper

Here is a regular `div` based on Gren's `Html`, `Html.Attributes` and `Html.Events` modules:

    Html.div
        [ Attributes.style "background-color" "yellow"
        , Attributes.style "font-size" "19pt"
        , Events.onClick DoStuff
        ]
        [ Html.p [] [ Html.text "Ein Absatz." ]
        , Html.p [] [ Html.text "Noch ein Absatz." ]
        ]

Here is the same `div` based on `Hyper`:

    Hyper.div
        |> Hyper.style "background" "yellow"
        |> Hyper.style "font-size" "19pt"
        |> Hyper.onClick DoStuff
        |> Hyper.children
            [ Hyper.p |> Hyper.children [ Hyper.text "Ein Absatz." ]
            , Hyper.p |> Hyper.children [ Hyper.text "Noch ein Absatz." ]
            ]
        |> Hyper.compile

What is the difference?

With `Hyper`, you can accumulate attributes and child elements using the pipe operator.
This should make it easier to create reusable HTML elements.
