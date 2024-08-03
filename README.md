# gren-hyper

Die HTML-Elemente aus
[gren-lang/browser](https://packages.gren-lang.org/package/gren-lang/browser/version/4.0.0/module/Html)
haben den Datentyp:

    Array (Attribute msg) -> Array (Html msg) -> Html msg

Man beginnt also bspw. damit:

    Html.div [] []

und füllt das mit Attributen und Kindknoten:

    myDiv =
        Html.div
            [ style "background-color" "yellow"
            , style "font-size" "19pt"
            , onClick DoStuff
            ]
            [ Html.p [] [ Html.text "Ein Absatz." ]
            , Html.p [] [ Html.text "Noch ein Absatz." ]
            ]


Danach kann man `myDiv` natürlich verwenden umweiteres
HTML-Markup zu konstruieren.  Aber ein Freiheitsgrad, den man
verloren hat sobald das fertige `myDiv : Html msg` vorliegt, ist
die Anpassung seiner Attribute und Kindknoten.  Etwas wie "`myDiv`
aber mit anderer Schriftgröße" lässt sich nicht ausdrücken;
jedenfalls nicht ohne die Konstruktion von `myDiv` anzupassen.

Mit `Hyper.element` kann man die HTML-Elemente aus gren-lang/browser
in eine Darstellung überführen, die das nachträgliche Anpassen
der Attribute und Kindknoten erlaubt, und schließlich mit
`Hyper.compile` in ein fertiges `Html msg` überführen:

    Hyper.element Html.div
        |> Hyper.style "background" "yellow"
        |> Hyper.style "font-size" "19pt"
        |> Hyper.children
            [ Hyper.element Html.p |> Hyper.children [ Hyper.text "Ein Absatz." ]
            , Hyper.element Html.p |> Hyper.children [ Hyper.text "Noch ein Absatz." ]
            ]
        |> Hyper.compile
