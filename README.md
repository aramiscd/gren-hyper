# gren-hyper

Die HTML-Bausteine aus
[gren-lang/browser](https://packages.gren-lang.org/package/gren-lang/browser/version/4.0.0/module/Html)
haben den Datentyp:

    Array (Attribute msg) -> Array (Html msg) -> Html msg

Man beginnt also bspw. damit:

    Html.div [] []

und füllt das mit Attributen und Kindknoten:

    myDiv =
        Html.div
            [ Attibutes.style "background-color" "yellow"
            , Attibutes.style "font-size" "19pt"
            , Events.onClick DoStuff
            ]
            [ Html.p [] [ Html.text "Ein Absatz." ]
            , Html.p [] [ Html.text "Noch ein Absatz." ]
            ]


Danach kann man `myDiv` natürlich verwenden umweiteres HTML-Markup
zu konstruieren.  Aber ein Freiheitsgrad, den man verloren hat
sobald das fertige `myDiv : Html msg` vorliegt, ist die Anpassung
seiner Attribute und Kindknoten.  Etwas wie _"`myDiv` aber mit
anderer Schriftgröße"_ lässt sich nicht ausdrücken; jedenfalls
nicht ohne die Definition von `myDiv` anzupassen.

Das `Hyper` Modul enthält HTML-Bausteine vom Typ `Node msg`, die
sich via Pipe-Operator mit Attributen und Kindknoten anreichern
lassen.  Damit ist der oben fehlende Freiheitsgrad gegeben.  Mit
`Hyper.compile` lässt sich `Node msg` in `Html msg` überführen:

    Hyper.div
        |> Hyper.style "background" "yellow"
        |> Hyper.style "font-size" "19pt"
        |> Hyper.onClick DoStuff
        |> Hyper.children
            [ Hyper.p |> Hyper.children [ Hyper.text "Ein Absatz." ]
            , Hyper.p |> Hyper.children [ Hyper.text "Noch ein Absatz." ]
            ]
        |> Hyper.compile

Wenn man das `Hyper.compile` so spät wie möglich verwendet
-- nämlich in der `view` Funktion, die in der `main` Funktion
aufgerufen wird -- kann man die komplette View-Logik auf dem
`Node msg` Datentyp aufbauen.
