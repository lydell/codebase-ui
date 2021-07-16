module UI.Icon exposing (..)

import Html exposing (Html, div)
import Html.Attributes exposing (class, classList)
import Svg exposing (Svg, circle, path, rect, svg)
import Svg.Attributes as Attrs exposing (cx, cy, d, fill, fillRule, height, r, rx, stroke, strokeWidth, viewBox, width, y)


type Icon msg
    = Icon String (List (Html.Attribute msg)) (List (Svg msg))


view : Icon msg -> Html msg
view (Icon name attrs content) =
    let
        iconAttrs =
            class "icon" :: class name :: attrs
    in
    div iconAttrs
        [ svg [ width "100%", height "100%", viewBox "0 0 14 14" ] content ]



-- MODIFIERS


withAttributes : List (Html.Attribute msg) -> Icon msg -> Icon msg
withAttributes attrsToAdd (Icon name attrs content) =
    Icon name (attrs ++ attrsToAdd) content


withClassList : List ( String, Bool ) -> Icon msg -> Icon msg
withClassList classes icon =
    withAttributes [ classList classes ] icon


withToggleAnimation : Bool -> Icon msg -> Icon msg
withToggleAnimation on icon =
    withClassList [ ( "animate", on ) ] icon



-- ICONS


unisonMark : Icon msg
unisonMark =
    Icon
        "unison-mark"
        []
        [ path [ fill "currentColor", fillRule "evenodd", d "M12.4255 3.88396C12.5728 4.03084 12.5728 4.27245 12.4255 4.41933C12.2781 4.56611 12.0357 4.56611 11.8883 4.41933C11.8181 4.34848 11.7786 4.25278 11.7786 4.15318C11.7786 3.94545 11.9502 3.77451 12.1587 3.77451C12.2585 3.77451 12.3545 3.81375 12.4256 3.88368L12.4255 3.88396ZM10.101 2.67362C10.3854 2.73037 10.6635 2.81492 10.9313 2.92603C11.1184 3.00356 11.2086 3.22155 11.1313 3.40898C11.0744 3.54687 10.9395 3.63726 10.7905 3.63726C10.7421 3.63726 10.6941 3.62769 10.6493 3.60909H10.6487C10.4285 3.51767 10.2 3.44784 9.96642 3.40056C9.96018 3.39947 9.95408 3.39825 9.94784 3.39689C9.72004 3.35208 9.48852 3.32893 9.25638 3.32775H9.2374C8.71088 3.32772 8.22276 3.04541 7.95941 2.58858C7.95778 2.58573 7.95602 2.58274 7.95453 2.57975C7.71295 2.16293 7.39239 1.79741 7.01089 1.50381C5.39449 0.260973 3.07904 0.566434 1.8382 2.18619C1.7684 2.27743 1.66 2.33102 1.54527 2.33102C1.34281 2.33102 1.1762 2.16409 1.1762 1.96122C1.1762 1.8799 1.20298 1.80079 1.25235 1.73625C1.25615 1.73136 1.26008 1.7266 1.26401 1.72185C1.61621 1.266 2.05372 0.883267 2.55203 0.595099C4.66886 -0.629803 7.37587 0.0968651 8.59895 2.21798V2.21866L8.60207 2.22395C8.7314 2.44458 8.96622 2.58275 9.22154 2.58844H9.23794C9.52791 2.58843 9.81718 2.61696 10.1016 2.67362H10.101ZM0.938763 7.40106C0.941883 7.39509 0.945409 7.38913 0.948936 7.38329C1.07451 7.15898 1.07415 6.88464 0.947986 6.66066C0.944324 6.65456 0.940933 6.64846 0.937542 6.64236C0.355782 5.62773 0.19896 4.42288 0.501616 3.29314C0.544727 3.1323 0.691605 3.01961 0.858129 3.01961C1.06061 3.01961 1.22723 3.18621 1.22723 3.38869C1.22723 3.42096 1.223 3.45308 1.21464 3.48424C0.962391 4.42608 1.09341 5.43053 1.57882 6.27616C1.58289 6.28294 1.58682 6.28986 1.59062 6.29691C1.84473 6.74743 1.84427 7.2998 1.5894 7.7499C1.58465 7.75844 1.57977 7.76699 1.57434 7.77526C1.33697 8.19126 1.18278 8.64948 1.12038 9.12436C0.854399 11.1452 2.2768 12.9983 4.29774 13.2644V13.2652C4.48045 13.2893 4.61855 13.4467 4.61855 13.631C4.61855 13.6471 4.61749 13.6632 4.61539 13.6792C4.58898 13.8796 4.40249 14.023 4.20198 13.9969H4.20266C3.626 13.9209 3.06994 13.732 2.56637 13.4409C0.449939 12.2202 -0.276786 9.51768 0.938763 7.40106ZM1.57568 7.83712C1.58518 7.82889 1.59393 7.82021 1.60187 7.81114L1.60288 7.80994C1.59464 7.81942 1.58555 7.8285 1.57568 7.83712ZM5.92412 13.9186C5.72234 13.9723 5.51174 13.8517 5.4576 13.6515C5.40346 13.4511 5.52506 13.2419 5.72698 13.1882C5.75773 13.1804 5.78933 13.1765 5.82106 13.1765C6.03006 13.1765 6.20203 13.3472 6.20203 13.5546C6.20203 13.7235 6.08805 13.8728 5.92426 13.9186H5.92412ZM9.26785 11.4315C9.00746 11.4315 8.76557 11.5688 8.63224 11.7921C8.63061 11.7952 8.62885 11.7983 8.62708 11.8013C8.4817 12.0527 8.31193 12.2891 8.12022 12.5073C8.18168 12.4372 8.18181 12.4376 8.12022 12.5073C8.11642 12.5116 8.11261 12.5158 8.10867 12.5199C7.91993 12.733 7.71108 12.9275 7.48502 13.1007C7.32409 13.2241 7.08997 13.1935 6.96634 13.0328C6.84281 12.8721 6.8735 12.6384 7.03432 12.5149C7.22657 12.3676 7.40384 12.2017 7.56361 12.0198C7.50433 12.0877 7.50419 12.0868 7.56361 12.0198C7.56823 12.0146 7.57285 12.0096 7.5772 12.0048C7.72866 11.8304 7.8634 11.6421 7.97964 11.4425C7.98182 11.4384 7.98413 11.4345 7.98644 11.4304C8.25062 10.9746 8.73971 10.693 9.26717 10.693C9.75299 10.693 10.2341 10.5974 10.6829 10.4117C12.5666 9.63257 13.4634 7.47928 12.6898 5.5967C12.6882 5.59317 12.6865 5.5895 12.685 5.58583C12.6673 5.54197 12.6583 5.49512 12.6583 5.44783C12.6583 5.24519 12.8253 5.07843 13.0282 5.07843C13.176 5.07843 13.3103 5.16691 13.3684 5.30264C13.5915 5.84064 13.7064 6.41731 13.7064 6.99964C13.7064 9.4478 11.7188 11.4325 9.26704 11.4325L9.26785 11.4315ZM8.90927 4.10364C9.00699 4.09299 9.10508 4.08713 9.20354 4.08604C9.21361 4.08594 9.22369 4.08589 9.23377 4.08589C10.8564 4.08589 12.1917 5.41648 12.1917 7.0335C12.1917 8.65049 10.8564 9.9811 9.23377 9.9811C9.12558 9.9811 9.01748 9.97518 8.90994 9.96337C8.30272 9.91688 7.72602 10.2485 7.46262 10.7957C6.99169 11.865 5.92571 12.5588 4.75392 12.5588C3.13116 12.5588 1.79582 11.2282 1.79582 9.61109C1.79582 8.97743 2.00086 8.36035 2.38035 7.85191C2.71507 7.35132 2.71059 6.69472 2.36907 6.19873C2.33375 6.15062 2.29992 6.10156 2.26759 6.05156C1.96075 5.5761 1.79755 5.02257 1.79755 4.45727C1.79755 2.84034 3.13275 1.5098 4.75537 1.5098C5.9266 1.5098 6.99214 2.20304 7.4633 3.27157C7.72667 3.81823 8.30276 4.14967 8.90954 4.10364H8.90927ZM2.91427 10.7573C3.3076 11.4466 4.03688 11.8725 4.82355 11.8725C6.03298 11.8725 7.0282 10.8657 7.0282 9.64216C7.0282 8.4186 6.03298 7.41177 4.82355 7.41177C4.43656 7.41177 4.05631 7.51485 3.72118 7.71062C2.67394 8.32252 2.30973 9.69771 2.91427 10.7573ZM7.32044 8.14944C7.71376 8.83871 8.44307 9.26471 9.22976 9.26471C10.4392 9.26471 11.4344 8.25788 11.4344 7.03431C11.4344 5.81076 10.4392 4.80392 9.22976 4.80392C8.84281 4.80392 8.46259 4.90699 8.12749 5.10272C7.08021 5.71456 6.71593 7.08977 7.32044 8.14944ZM4.82577 6.65686C6.0341 6.65648 7.0282 5.64976 7.0282 4.42647C7.0282 3.20292 6.03368 2.19608 4.82509 2.19608C3.6165 2.19608 2.62199 3.20292 2.62199 4.42647C2.62199 4.42661 2.62199 4.42674 2.62199 4.42688C2.62229 5.65031 3.61677 6.65686 4.82523 6.65686C4.8254 6.65686 4.82558 6.65686 4.82577 6.65686Z" ] [] ]



-- Definition types


patch : Icon msg
patch =
    Icon
        "patch"
        []
        [ path [ fill "currentColor", d "M4.12358 7.7358H10.6349L8.07386 10.2884L8.83239 11.0554L12.706 7.18182L8.83239 3.30824L8.07386 4.06676L10.6349 6.62784H4.12358C3.15199 6.62784 2.36364 5.83949 2.36364 4.86364C2.36364 3.89631 3.15625 3.10369 4.12358 3.10369H4.60085V2H4.12358C2.54261 2 1.25994 3.28267 1.25994 4.86364C1.25994 6.4446 2.54261 7.7358 4.12358 7.7358Z" ] [] ]


dataConstructor : Icon msg
dataConstructor =
    Icon
        "data-constructor"
        []
        [ path [ fill "currentColor", d "M4.44415 4.49805V3.66016H3.20197L3.19611 3.08008C3.19611 2.85352 3.2254 2.65234 3.284 2.47656C3.34259 2.30078 3.43439 2.1543 3.55939 2.03711C3.68048 1.91602 3.83673 1.82617 4.02814 1.76758C4.21954 1.70508 4.4422 1.67188 4.69611 1.66797C4.85236 1.66797 4.99884 1.68359 5.13556 1.71484C5.27618 1.74609 5.39728 1.78711 5.49884 1.83789L5.63361 0.976562C5.45001 0.910156 5.27032 0.855469 5.09454 0.8125C4.92267 0.769531 4.74493 0.748047 4.56134 0.748047C4.18634 0.748047 3.84845 0.798828 3.54767 0.900391C3.24689 1.00195 2.99103 1.15039 2.78009 1.3457C2.56525 1.54492 2.40118 1.79102 2.2879 2.08398C2.17462 2.37305 2.11798 2.70508 2.11798 3.08008V3.66016H1.08087V4.49805H2.11798V10.3047C2.11407 10.5586 2.07892 10.7812 2.01251 10.9727C1.95001 11.1641 1.85626 11.3184 1.73126 11.4355C1.64923 11.5098 1.55157 11.5664 1.43829 11.6055C1.32892 11.6484 1.20782 11.6699 1.07501 11.6699C0.989075 11.6699 0.852356 11.6543 0.664856 11.623C0.481262 11.5918 0.332825 11.5449 0.219543 11.4824L0.137512 12.3496C0.289856 12.4277 0.444153 12.4824 0.600403 12.5137C0.756653 12.5449 0.914856 12.5605 1.07501 12.5605C1.40704 12.5605 1.70392 12.5098 1.96564 12.4082C2.23126 12.3105 2.45587 12.166 2.63947 11.9746C2.81915 11.7871 2.95782 11.5527 3.05548 11.2715C3.15314 10.9902 3.20197 10.668 3.20197 10.3047V4.49805H4.44415Z" ] []
        , path [ fill "currentColor", d "M6.52073 8.46591L8.62301 6.36364L6.52073 4.28977L4.41846 6.36364L6.52073 8.46591ZM9.2196 11.1364L11.2935 9.0625L9.2196 6.96023L7.11732 9.0625L9.2196 11.1364ZM9.2196 5.76705L11.2935 3.69318L9.2196 1.59091L7.11732 3.69318L9.2196 5.76705ZM11.8901 8.46591L13.9639 6.36364L11.8901 4.28977L9.81619 6.36364L11.8901 8.46591ZM6.52073 7.39347L5.50156 6.36364L6.52073 5.34801L7.54346 6.36364L6.52073 7.39347ZM11.8901 7.39347L10.8673 6.36364L11.8901 5.34801L12.9057 6.36364L11.8901 7.39347ZM9.2196 4.6946L8.20042 3.69318L9.2196 2.66335L10.2175 3.69318L9.2196 4.6946ZM9.2196 10.0639L8.20042 9.0625L9.2196 8.04688L10.2175 9.0625L9.2196 10.0639Z" ] []
        ]


abilityConstructor : Icon msg
abilityConstructor =
    Icon
        "ability-constructor"
        []
        [ path [ fill "currentColor", d "M4.44415 4.49805V3.66016H3.20197L3.19611 3.08008C3.19611 2.85352 3.2254 2.65234 3.284 2.47656C3.34259 2.30078 3.43439 2.1543 3.55939 2.03711C3.68048 1.91602 3.83673 1.82617 4.02814 1.76758C4.21954 1.70508 4.4422 1.67188 4.69611 1.66797C4.85236 1.66797 4.99884 1.68359 5.13556 1.71484C5.27618 1.74609 5.39728 1.78711 5.49884 1.83789L5.63361 0.976562C5.45001 0.910156 5.27032 0.855469 5.09454 0.8125C4.92267 0.769531 4.74493 0.748047 4.56134 0.748047C4.18634 0.748047 3.84845 0.798828 3.54767 0.900391C3.24689 1.00195 2.99103 1.15039 2.78009 1.3457C2.56525 1.54492 2.40118 1.79102 2.2879 2.08398C2.17462 2.37305 2.11798 2.70508 2.11798 3.08008V3.66016H1.08087V4.49805H2.11798V10.3047C2.11407 10.5586 2.07892 10.7812 2.01251 10.9727C1.95001 11.1641 1.85626 11.3184 1.73126 11.4355C1.64923 11.5098 1.55157 11.5664 1.43829 11.6055C1.32892 11.6484 1.20782 11.6699 1.07501 11.6699C0.989075 11.6699 0.852356 11.6543 0.664856 11.623C0.481262 11.5918 0.332825 11.5449 0.219543 11.4824L0.137512 12.3496C0.289856 12.4277 0.444153 12.4824 0.600403 12.5137C0.756653 12.5449 0.914856 12.5605 1.07501 12.5605C1.40704 12.5605 1.70392 12.5098 1.96564 12.4082C2.23126 12.3105 2.45587 12.166 2.63947 11.9746C2.81915 11.7871 2.95782 11.5527 3.05548 11.2715C3.15314 10.9902 3.20197 10.668 3.20197 10.3047V4.49805H4.44415Z" ] []
        , path [ fill "currentColor", d "M9.08807 9.2642V8.35795C8.41477 8.35795 8.27841 8.09943 8.27841 7.55114V6.72159C8.27841 6.28409 8.09091 5.89205 7.26705 5.72443V5.6108C8.09091 5.44318 8.27841 5.05114 8.27841 4.61648V3.78693C8.27841 3.2358 8.41477 2.97727 9.08807 2.97727V2.07386C7.94034 2.07386 7.11932 2.2642 7.11932 3.66477V4.29261C7.11932 4.875 6.90057 5.12216 6.24716 5.12216V6.21307C6.90057 6.21307 7.11932 6.46023 7.11932 7.04261V7.6733C7.11932 9.07386 7.94034 9.2642 9.08807 9.2642ZM10.3839 2.07102V2.97727C11.0572 2.97727 11.1935 3.2358 11.1935 3.78409V4.61364C11.1935 5.05114 11.381 5.44318 12.2049 5.6108V5.72443C11.381 5.89205 11.1935 6.28409 11.1935 6.71875V7.5483C11.1935 8.09943 11.0572 8.35795 10.3839 8.35795V9.26136C11.5316 9.26136 12.3526 9.07102 12.3526 7.67045V7.04261C12.3526 6.46023 12.5714 6.21307 13.2248 6.21307V5.12216C12.5714 5.12216 12.3526 4.875 12.3526 4.29261V3.66193C12.3526 2.26136 11.5316 2.07102 10.3839 2.07102Z" ] []
        ]


ability : Icon msg
ability =
    Icon
        "ability"
        []
        [ path [ fill "currentColor", d "M5.93519 11.8537V10.6733C4.93377 10.6733 4.69513 10.2642 4.69513 9.37784V7.98011C4.69513 7.31534 4.43093 6.75284 3.28036 6.52273V6.3608C4.43093 6.13068 4.69513 5.56392 4.69513 4.89915V3.50142C4.69513 2.61932 4.93377 2.21023 5.93519 2.21023V1.02557C4.23065 1.02557 3.22923 1.45597 3.22923 3.37784V4.46449C3.22923 5.35938 2.89684 5.72585 1.92951 5.72585V7.15767C2.89684 7.15767 3.22923 7.52415 3.22923 8.41903V9.50142C3.22923 11.4233 4.23065 11.8537 5.93519 11.8537ZM8.06374 1.02983V2.21023C9.06516 2.21023 9.3038 2.61932 9.3038 3.50568V4.90341C9.3038 5.56818 9.568 6.13068 10.7186 6.3608V6.52273C9.568 6.75284 9.3038 7.3196 9.3038 7.98438V9.3821C9.3038 10.2642 9.06516 10.6733 8.06374 10.6733V11.858C9.76829 11.858 10.7697 11.4276 10.7697 9.50568V8.41903C10.7697 7.52415 11.1021 7.15767 12.0694 7.15767V5.72585C11.1021 5.72585 10.7697 5.35938 10.7697 4.46449V3.3821C10.7697 1.46023 9.76829 1.02983 8.06374 1.02983Z" ] [] ]


test : Icon msg
test =
    let
        (Icon _ _ content) =
            checkmark
    in
    Icon "test" [] content


doc : Icon msg
doc =
    Icon
        "doc"
        []
        [ path [ stroke "currentColor", d "M2 4h2a1 1 0 001-1V1m5.842 1v10a1 1 0 01-1 1H3a1 1 0 01-1-1V3.914a1 1 0 01.293-.707l1.914-1.914A1 1 0 014.914 1h4.928a1 1 0 011 1z", fill "none" ] [] ]


term : Icon msg
term =
    Icon
        "term"
        []
        [ path [ fill "currentColor", d "M9.1123 4.82715V3.60352H7.68359V3.00879C7.68359 2.77637 7.71322 2.57129 7.77246 2.39355C7.83626 2.21582 7.93424 2.06543 8.06641 1.94238C8.19857 1.81478 8.36947 1.71908 8.5791 1.65527C8.79329 1.58691 9.04167 1.55046 9.32422 1.5459C9.51562 1.5459 9.6888 1.56413 9.84375 1.60059C10.0033 1.63704 10.1445 1.68717 10.2676 1.75098L10.4316 0.472656C10.2038 0.395182 9.98503 0.33138 9.77539 0.28125C9.56576 0.226562 9.34701 0.199219 9.11914 0.199219C8.64518 0.199219 8.21908 0.260742 7.84082 0.383789C7.46257 0.506836 7.14128 0.68457 6.87695 0.916992C6.60807 1.15397 6.40299 1.44792 6.26172 1.79883C6.12044 2.14974 6.0498 2.55306 6.0498 3.00879V3.60352H4.90137V4.82715H6.0498V11.1982C6.0498 11.4717 6.0179 11.7109 5.9541 11.916C5.8903 12.1211 5.79232 12.2852 5.66016 12.4082C5.57357 12.4857 5.46875 12.5472 5.3457 12.5928C5.22266 12.6383 5.08366 12.6611 4.92871 12.6611C4.82389 12.6611 4.65983 12.6406 4.43652 12.5996C4.21322 12.5632 4.04915 12.5085 3.94434 12.4355L3.8418 13.7344C4.04232 13.8301 4.24284 13.8962 4.44336 13.9326C4.64388 13.9691 4.84668 13.9873 5.05176 13.9873C5.46647 13.9873 5.83561 13.9258 6.15918 13.8027C6.4873 13.6842 6.7653 13.5065 6.99316 13.2695C7.21647 13.0326 7.38737 12.7409 7.50586 12.3945C7.62435 12.0482 7.68359 11.6494 7.68359 11.1982V4.82715H9.1123Z" ] [] ]


type_ : Icon msg
type_ =
    Icon
        "type"
        []
        [ path [ fill "currentColor", d "M3.26571 9.85227L6.2089 6.90909L3.26571 4.00568L0.322532 6.90909L3.26571 9.85227ZM7.04412 13.5909L9.94753 10.6875L7.04412 7.74432L4.10094 10.6875L7.04412 13.5909ZM7.04412 6.07386L9.94753 3.17045L7.04412 0.227272L4.10094 3.17045L7.04412 6.07386ZM10.7828 9.85227L13.6862 6.90909L10.7828 4.00568L7.87935 6.90909L10.7828 9.85227ZM3.26571 8.35085L1.83887 6.90909L3.26571 5.48722L4.69753 6.90909L3.26571 8.35085ZM10.7828 8.35085L9.35094 6.90909L10.7828 5.48722L12.2046 6.90909L10.7828 8.35085ZM7.04412 4.57244L5.61728 3.17045L7.04412 1.72869L8.44114 3.17045L7.04412 4.57244ZM7.04412 12.0895L5.61728 10.6875L7.04412 9.26562L8.44114 10.6875L7.04412 12.0895Z" ] [] ]



-- General purpose


search : Icon msg
search =
    let
        shine cl =
            path
                [ Attrs.class cl
                , fill "currentColor"
                , d "M3.50032 6C3.224 6 2.99575 5.77447 3.04162 5.50199C3.09728 5.1714 3.20815 4.85128 3.37072 4.5554C3.61392 4.11274 3.96495 3.73866 4.39125 3.46782C4.81756 3.19698 5.30534 3.03815 5.80938 3.00606C6.1463 2.98461 6.4832 3.02025 6.80611 3.11033C7.07227 3.18458 7.17945 3.48702 7.06205 3.73716C6.94465 3.9873 6.64623 4.08789 6.37481 4.03609C6.21016 4.00466 6.04157 3.99395 5.87296 4.00468C5.53704 4.02607 5.21196 4.13192 4.92785 4.31242C4.64374 4.49292 4.40979 4.74223 4.24771 5.03724C4.16636 5.18531 4.10443 5.34248 4.06292 5.50488C3.99449 5.77259 3.77664 6 3.50032 6Z"
                ]
                []
    in
    Icon
        "search"
        []
        [ path [ fill "currentColor", fillRule "evenodd", d "M6 10C8.20914 10 10 8.20914 10 6C10 3.79086 8.20914 2 6 2C3.79086 2 2 3.79086 2 6C2 8.20914 3.79086 10 6 10ZM6 11C8.76142 11 11 8.76142 11 6C11 3.23858 8.76142 1 6 1C3.23858 1 1 3.23858 1 6C1 8.76142 3.23858 11 6 11Z" ] []
        , path [ fill "currentColor", d "M9.30008 8.94652C9.49534 8.75126 9.81192 8.75126 10.0072 8.94652L13.0793 12.0186C13.2745 12.2139 13.2745 12.5304 13.0793 12.7257C12.884 12.921 12.5674 12.921 12.3722 12.7257L9.30008 9.65362C9.10482 9.45836 9.10482 9.14178 9.30008 8.94652Z" ] []
        , shine "search-shine-trail-3"
        , shine "search-shine-trail-2"
        , shine "search-shine-trail-1"
        , shine "search-shine"
        ]


caretDown : Icon msg
caretDown =
    Icon "caret-down" [] [ path [ fill "currentColor", d "M3.363 4.182l3.636 6.182 3.636-6.182H3.363z" ] [] ]


caretLeft : Icon msg
caretLeft =
    Icon "caret-left" [] [ path [ fill "currentColor", d "M9.908 10.727V3.455L3.726 7.09l6.182 3.636z" ] [] ]


caretRight : Icon msg
caretRight =
    Icon "caret-right" [] [ path [ fill "currentColor", d "M4.09 10.727l6.182-3.636L4.09 3.455v7.272z" ] [] ]


caretUp : Icon msg
caretUp =
    Icon "caret-up" [] [ path [ fill "currentColor", d "M3.363 10h7.272L7 3.818 3.363 10z" ] [] ]


arrowDown : Icon msg
arrowDown =
    Icon "arrow-down" [] [ path [ fill "currentColor", d "M7.45504 3.17663C7.45504 2.91774 7.24518 2.70788 6.98629 2.70788V2.70788C6.72741 2.70788 6.51754 2.91774 6.51754 3.17663V9.11C6.51754 9.33273 6.24826 9.44427 6.09077 9.28678L4.14397 7.33999C3.9631 7.15911 3.66955 7.16007 3.48986 7.34212V7.34212C3.31182 7.5225 3.31277 7.81276 3.49198 7.99197L6.63313 11.1331C6.82824 11.3282 7.14452 11.3284 7.33985 11.1335L10.4803 8.00005C10.6636 7.81713 10.6628 7.51988 10.4785 7.33794V7.33794C10.2959 7.15759 10.0018 7.15877 9.82054 7.34058L7.8821 9.28515C7.72472 9.44303 7.45504 9.33157 7.45504 9.10865L7.45504 3.17663Z" ] [] ]


arrowLeft : Icon msg
arrowLeft =
    Icon "arrow-left" [] [ path [ fill "currentColor", d "M10.8135 7.46875C11.0724 7.46875 11.2823 7.25888 11.2823 7V7C11.2823 6.74111 11.0724 6.53125 10.8135 6.53125L4.88017 6.53125C4.65744 6.53125 4.5459 6.26196 4.70339 6.10447L6.65019 4.15767C6.83106 3.9768 6.8301 3.68325 6.64805 3.50356V3.50356C6.46767 3.32553 6.17741 3.32648 5.9982 3.50569L2.85705 6.64684C2.66194 6.84195 2.66176 7.15822 2.85665 7.35355L5.99012 10.494C6.17304 10.6773 6.4703 10.6766 6.65224 10.4922V10.4922C6.83258 10.3096 6.8314 10.0155 6.64959 9.83424L4.70502 7.8958C4.54715 7.73843 4.6586 7.46875 4.88152 7.46875L10.8135 7.46875Z" ] [] ]


arrowRight : Icon msg
arrowRight =
    Icon "arrow-right" [] [ path [ fill "currentColor", d "M3.16291 6.53514C2.90403 6.53514 2.69416 6.74501 2.69416 7.00389V7.00389C2.69416 7.26278 2.90403 7.47264 3.16291 7.47264L9.09629 7.47264C9.31901 7.47264 9.43056 7.74193 9.27306 7.89942L7.32627 9.84622C7.14539 10.0271 7.14635 10.3206 7.32841 10.5003V10.5003C7.50878 10.6784 7.79905 10.6774 7.97826 10.4982L11.1194 7.35705C11.3145 7.16195 11.3147 6.84567 11.1198 6.65034L7.98633 3.50988C7.80341 3.32655 7.50616 3.32734 7.32422 3.51164V3.51164C7.14387 3.69433 7.14505 3.98842 7.32686 4.16965L9.27143 6.10809C9.42931 6.26547 9.31785 6.53514 9.09494 6.53514L3.16291 6.53514Z" ] [] ]


arrowUp : Icon msg
arrowUp =
    Icon "arrow-up" [] [ path [ fill "currentColor", d "M6.52143 10.8273C6.52143 11.0861 6.73129 11.296 6.99018 11.296V11.296C7.24906 11.296 7.45893 11.0861 7.45893 10.8273L7.45893 4.89389C7.45893 4.67116 7.72821 4.55962 7.8857 4.71711L9.8325 6.66391C10.0134 6.84478 10.3069 6.84382 10.4866 6.66177V6.66177C10.6646 6.48139 10.6637 6.19113 10.4845 6.01192L7.34334 2.87077C7.14823 2.67566 6.83195 2.67548 6.63662 2.87037L3.49616 6.00384C3.31283 6.18676 3.31362 6.48401 3.49793 6.66595V6.66595C3.68062 6.8463 3.9747 6.84512 4.15593 6.66331L6.09437 4.71874C6.25175 4.56087 6.52143 4.67232 6.52143 4.89524L6.52143 10.8273Z" ] [] ]


checkmark : Icon msg
checkmark =
    Icon
        "checkmark"
        []
        [ path [ fill "currentColor", d "M2.48236 6.32095C2.21545 6.59334 2.21845 7.0301 2.48908 7.2988L4.77938 9.57277C5.16976 9.96036 5.7999 9.95986 6.18966 9.57164L11.2999 4.48151C11.5729 4.20965 11.5738 3.76805 11.3021 3.49497C11.0302 3.22166 10.5881 3.22069 10.315 3.4928L5.83618 7.9549C5.64178 8.14858 5.3276 8.14938 5.13221 7.95669L3.46499 6.31254C3.19157 6.0429 2.75113 6.04667 2.48236 6.32095Z" ] [] ]


chevronDown : Icon msg
chevronDown =
    Icon "chevron-down" [] [ path [ fill "currentColor", d "M10.324 5.449l-3.32 3.31-3.322-3.31-.756.756 4.077 4.076 4.077-4.076-.756-.756z" ] [] ]


chevronUp : Icon msg
chevronUp =
    Icon "chevron-up" [] [ path [ fill "currentColor", d "M3.676 8.551l3.32-3.31 3.322 3.31.756-.756L6.997 3.72 2.92 7.795l.756.756z" ] [] ]


folder : Icon msg
folder =
    Icon
        "folder"
        []
        [ path [ stroke "currentColor", d "M.5 3V2a.5.5 0 01.5-.5h4a.5.5 0 01.4.2l.9 1.2.4-.3-.4.3a1.5 1.5 0 001.2.6H13a.5.5 0 01.5.5v8a.5.5 0 01-.5.5H1a.5.5 0 01-.5-.5V3z" ] [] ]


hash : Icon msg
hash =
    Icon
        "hash"
        []
        [ path [ fill "currentColor", d "M7.629 9.197L7.082 12h.978l.546-2.803h1.723v-.936H8.784l.472-2.42h1.586v-.95H9.44l.561-2.844h-.978l-.56 2.844H6.658l.56-2.844h-.977l-.56 2.844H3.732v.95h1.764l-.472 2.42H3.213v.936h1.634L4.3 12h.977l.547-2.803H7.63zm-1.627-.936l.472-2.42h1.804l-.471 2.42H6.002z" ] [] ]


plus : Icon msg
plus =
    Icon "plus" [] [ path [ fill "currentColor", d "M6.443 11.304h1.113V8.58h2.725V7.466H7.556V4.74H6.443v2.725H3.718V8.58h2.725v2.724z" ] [] ]


warn : Icon msg
warn =
    Icon
        "warn"
        []
        [ path [ fill "currentColor", d "M1.9087 9.4855C1.50878 10.152 1.9889 11 2.76619 11H11.2338C12.0111 11 12.4912 10.152 12.0913 9.4855L7.85749 2.42916C7.46909 1.78182 6.53091 1.78182 6.14251 2.42915L1.9087 9.4855ZM7 7.28472C6.69954 7.28472 6.45372 7.04545 6.44561 6.7451L6.39724 4.95258C6.38809 4.61331 6.66061 4.33333 7 4.33333C7.33939 4.33333 7.61191 4.61331 7.60276 4.95258L7.55439 6.74509C7.54628 7.04545 7.30046 7.28472 7 7.28472ZM7 9.88021C6.54425 9.88021 6.17699 9.51996 6.17699 9.07292C6.17699 8.62587 6.54425 8.26562 7 8.26562C7.45575 8.26562 7.82301 8.62587 7.82301 9.07292C7.82301 9.51996 7.45575 9.88021 7 9.88021Z" ] [] ]


x : Icon msg
x =
    Icon "x" [] [ path [ stroke "currentColor", strokeWidth "1.5", d "M2 2l10 10M2 12L12 2" ] [] ]


dot : Icon msg
dot =
    Icon "dot" [] [ circle [ fill "currentColor", cx "7", cy "7", r "2" ] [] ]


dash : Icon msg
dash =
    Icon "dash" [] [ rect [ fill "currentColor", Attrs.x "3", y "5", width "8", height "4", rx "2" ] [] ]


github : Icon msg
github =
    Icon "github" [] [ path [ fill "currentColor", fillRule "evenodd", d "M6.99945 1C3.68664 1 1 3.68627 1 7.00019C1 9.6511 2.71902 11.8998 5.10326 12.6932C5.40345 12.7484 5.51285 12.5632 5.51285 12.404C5.51285 12.2619 5.50769 11.8843 5.50474 11.3837C3.83581 11.7462 3.48368 10.5793 3.48368 10.5793C3.21075 9.88609 2.81736 9.70156 2.81736 9.70156C2.2726 9.32954 2.85862 9.3369 2.85862 9.3369C3.46085 9.37926 3.77761 9.95534 3.77761 9.95534C4.3128 10.8721 5.18208 10.6073 5.5239 10.4537C5.57841 10.0662 5.73348 9.80174 5.90475 9.65183C4.57248 9.50045 3.1717 8.98551 3.1717 6.68636C3.1717 6.03146 3.4056 5.49553 3.7894 5.07637C3.72752 4.92462 3.52162 4.31428 3.84833 3.48847C3.84833 3.48847 4.35185 3.32714 5.49811 4.10359C5.97658 3.97026 6.49004 3.90396 7.00018 3.90138C7.50996 3.90396 8.02305 3.97026 8.50226 4.10359C9.64778 3.32714 10.1506 3.48847 10.1506 3.48847C10.478 4.31428 10.2721 4.92462 10.2106 5.07637C10.5951 5.49553 10.8272 6.03146 10.8272 6.68636C10.8272 8.99141 9.4242 9.4986 8.08788 9.64704C8.30299 9.83232 8.49489 10.1984 8.49489 10.7583C8.49489 11.5602 8.48752 12.2073 8.48752 12.404C8.48752 12.5646 8.59581 12.7514 8.90006 12.6928C11.2825 11.8976 13 9.65036 13 7.00019C13 3.68627 10.3134 1 6.99945 1Z" ] [] ]
